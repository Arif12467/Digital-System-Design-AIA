LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY trigger IS
	PORT ( 
		pdm_m_clk_o : OUT std_logic; 
        pdm_m_data_i : IN std_logic;
		clk_sys : IN STD_LOGIC;
		switch : OUT STD_LOGIC
		);
END trigger;

ARCHITECTURE Behavioral OF trigger IS

	COMPONENT deserializer IS
		PORT ( 
        bit_number: INTEGER := 16;  --how many bits are used
        
        clk_mic : IN STD_LOGIC;     --clock
        pdm_data : IN STD_LOGIC; -- Input PDM data from the microphone
        data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0); --16 bit value of the sound
        done : OUT STD_LOGIC; --signals that the 16 bit bundle is full
        lrsel : OUT STD_LOGIC
		);
	END COMPONENT;

	signal data1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL clk_mic1 : STD_LOGIC;
	SIGNAL done1 : STD_LOGIC;


BEGIN 

	d1 : deserializer
	PORT MAP(
		data => data1,
		clk_mic => clk_mic1,
		pdm_data => pdm_m_data_i,
		done => done1
	);

	pdm_m_clk_o <= clk_mic1;

	trg: PROCESS IS 
	BEGIN
		WAIT UNTIL rising_edge(clk_sys);
		IF data1 >= "1000000000000000" THEN
			switch <= '1' ;
		ELSE
			switch <= '0';
	END IF;
	
	END PROCESS trg;
	
END Behavioral;