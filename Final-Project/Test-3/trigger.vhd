LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY trigger IS
	PORT ( 
		clk_in_t : in STD_LOGIC;
		-- microphone signals
        micData_t : in STD_LOGIC;
        micClk_t: out STD_LOGIC;  -- microphone clk
        micLRSel_t: out STD_LOGIC;  -- microphone sel (0 for micClk rising edge)
		switch : OUT STD_LOGIC
		);
END trigger;

ARCHITECTURE Behavioral OF trigger IS

	COMPONENT PdmDes IS
		generic(
          C_NR_OF_BITS : integer := 16;
          C_SYS_CLK_FREQ_MHZ : integer := 100;
          C_PDM_FREQ_HZ : integer := 2000000
		);
		PORT ( 
		clk_i : in std_logic;
		en_i : in std_logic; -- Enable deserializing (during record)
      
		done_o : out std_logic; -- Signaling that 16 bits are deserialized
		data_o : out std_logic_vector(C_NR_OF_BITS - 1 downto 0); -- output deserialized data
      
		-- PDM
		pdm_m_clk_o : out std_logic; -- Output M_CLK signal to the microphone
		pdm_m_data_i : in std_logic; -- Input PDM data from the microphone
		pdm_lrsel_o : out std_logic; -- Set to '0', therefore data is read on the positive edge
		pdm_clk_rising_o : out std_logic -- Signaling the rising edge of M_CLK, used by the MicDisplay
										 -- component in the VGA controller
		);
	END COMPONENT;

	signal en_des : std_logic := '1';
    signal done_async_des : std_logic;
    signal data_des : std_logic_vector(15 downto 0) := (others => '0');
    signal pdm_clk_rising : std_logic;


BEGIN 

	Deserializer: PdmDes
	generic map(
          C_NR_OF_BITS         => 16,
          C_SYS_CLK_FREQ_MHZ   => 100,
          C_PDM_FREQ_HZ       => 2000000)
    port map(
          clk_i                => clk_in_t,
          en_i                 => en_des,
          done_o               => done_async_des,
          data_o               => data_des,
          pdm_m_clk_o          => micClk_t,
          pdm_m_data_i         => micData_t,
          pdm_lrsel_o          => micLRSel_t,
          pdm_clk_rising_o     => pdm_clk_rising
        );


	trg: PROCESS IS 
	BEGIN
		WAIT UNTIL rising_edge(clk_in_t);
		IF data_des >= "1011101110000000" THEN
			switch <= '1' ;
		ELSE
			switch <= '0';
	END IF;
	
	END PROCESS trg;
	
END Behavioral;
