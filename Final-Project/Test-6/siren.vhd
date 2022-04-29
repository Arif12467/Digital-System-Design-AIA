library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;



ENTITY siren IS
	PORT (
		clk_in : in STD_LOGIC;
		-- microphone signals
        micData : in STD_LOGIC;
        micClk: out STD_LOGIC;  -- microphone clk
        micLRSel: out STD_LOGIC;  -- microphone sel (0 for micClk rising edge)
		-- DAC
		dac_MCLK : OUT STD_LOGIC; -- outputs to PMODI2L DAC
		dac_LRCK : OUT STD_LOGIC;
		dac_SCLK : OUT STD_LOGIC;
		dac_SDIN : OUT STD_LOGIC;
		
		anode : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
	);
END siren;



ARCHITECTURE Behavioral OF siren IS
	CONSTANT lo_tone : UNSIGNED (13 DOWNTO 0) := to_unsigned (344, 14); -- lower limit of siren = 256 Hz
	CONSTANT hi_tone : UNSIGNED (13 DOWNTO 0) := to_unsigned (687, 14); -- upper limit of siren = 512 Hz
	CONSTANT wail_speed : UNSIGNED (7 DOWNTO 0) := to_unsigned (8, 8); -- sets wailing speed
	
	
	
	COMPONENT dac_if IS
		PORT (
			SCLK : IN STD_LOGIC;
			L_start : IN STD_LOGIC;
			R_start : IN STD_LOGIC;
			L_data : IN signed (15 DOWNTO 0);
			R_data : IN signed (15 DOWNTO 0);
			SDATA : OUT STD_LOGIC
		);
	END COMPONENT;
	
	
	
	COMPONENT trigger IS
		PORT (
		clk_in_t : in STD_LOGIC;
		-- microphone signals
        micData_t : in STD_LOGIC;
        micClk_t: out STD_LOGIC;  -- microphone clk
        micLRSel_t: out STD_LOGIC;  -- microphone sel (0 for micClk rising edge)
		data_ot : out std_logic_vector(15 downto 0);
		switch : OUT STD_LOGIC
		);
	END COMPONENT;
	
	
	
	COMPONENT wail IS
		PORT (
			lo_pitch : IN UNSIGNED (13 DOWNTO 0);
			hi_pitch : IN UNSIGNED (13 DOWNTO 0);
			wspeed : IN UNSIGNED (7 DOWNTO 0);
			wclk : IN STD_LOGIC;
			audio_clk : IN STD_LOGIC;
			audio_data : OUT SIGNED (15 DOWNTO 0)
		);
	END COMPONENT;
	

	COMPONENT leddec IS
		PORT (
			dig : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
			data : IN STD_LOGIC_VECTOR (15 DOWNTO 0); -- DON'T change, data is fixed 4 bits in leddec for each displays
			anode : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL S : STD_LOGIC_VECTOR (15 DOWNTO 0); -- Connect C1 and L1 for values of 4 digits
	SIGNAL md : STD_LOGIC_VECTOR (2 DOWNTO 0); -- mpx selects displays
	SIGNAL display : STD_LOGIC_VECTOR (3 DOWNTO 0); -- Send digit for only one display to leddec
	
	SIGNAL extradata : STD_LOGIC_VECTOR (15 DOWNTO 0);
	
	SIGNAL tcount : unsigned (19 DOWNTO 0) := (OTHERS => '0'); -- timing counter
	SIGNAL data_L, data_R : SIGNED (15 DOWNTO 0); -- 16-bit signed audio data
	SIGNAL dac_load_L, dac_load_R : STD_LOGIC; -- timing pulses to load DAC shift reg.
	SIGNAL slo_clk, sclk, audio_CLK : STD_LOGIC;
	SIGNAL swtch : STD_LOGIC;
	SIGNAL micClk_i : STD_LOGIC;
	
	
BEGIN
	-- this process sets up a 20 bit binary counter clocked at 50MHz. This is used
	-- to generate all necessary timing signals. dac_load_L and dac_load_R are pulses
	-- sent to dac_if to load parallel data into shift register for serial clocking
	-- out to DAC
	tim_pr : PROCESS
	BEGIN
		WAIT UNTIL rising_edge(clk_in); -- AND rising_edge(swtch);
		IF (tcount(9 DOWNTO 0) >= X"00F") AND (tcount(9 DOWNTO 0) < X"02E") AND swtch = '1' THEN
			dac_load_L <= '1';
		ELSE
			dac_load_L <= '0';
		END IF;
		IF (tcount(9 DOWNTO 0) >= X"20F") AND (tcount(9 DOWNTO 0) < X"22E") AND swtch = '1' THEN
			dac_load_R <= '1';
		ELSE 
			dac_load_R <= '0';
		END IF;
		tcount <= tcount + 1;
	END PROCESS;
	
	
	display <= S(3 DOWNTO 0) WHEN md = "000" ELSE
	           S(7 DOWNTO 4) WHEN md = "001" ELSE
	           S(11 DOWNTO 8) WHEN md = "010" ELSE
	           S(15 DOWNTO 12);
	
	
	
	
	
	dac_MCLK <= NOT tcount(1); -- DAC master clock (12.5 MHz)
	audio_CLK <= tcount(9); -- audio sampling rate (48.8 kHz)
	dac_LRCK <= audio_CLK; -- also sent to DAC as left/right clock
	sclk <= tcount(4); -- serial data clock (1.56 MHz)
	dac_SCLK <= sclk; -- also sent to DAC as SCLK
	slo_clk <= tcount(19); -- clock to control wailing of tone (47.6 Hz)
	
	
		
		
	L1 : leddec
	PORT MAP(
		dig => md, 
		data => extradata, 
		anode => anode, 
		seg => seg
	);
	
	
	t1 : trigger
	PORT MAP(
		clk_in_t => clk_in,
        micData_t => micData,
        micClk_t => micClk,
        micLRSel_t => micLRSel,
		data_ot => extradata,
		switch  => swtch
	);
	


	dac : dac_if
	PORT MAP(
		SCLK => sclk, -- instantiate parallel to serial DAC interface
		L_start => dac_load_L, 
		R_start => dac_load_R, 
		L_data => data_L, 
		R_data => data_R, 
		SDATA => dac_SDIN 
		);



	w1 : wail
	PORT MAP(
		lo_pitch => lo_tone, -- instantiate wailing siren
		hi_pitch => hi_tone, 
		wspeed => wail_speed, 
		wclk => slo_clk, 
		audio_clk => audio_clk, 
		audio_data => data_L
		);
		data_R <= data_L; -- duplicate data on right channel

END Behavioral;