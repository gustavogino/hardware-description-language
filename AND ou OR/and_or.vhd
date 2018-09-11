library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity and_or is

generic (
	p_data : integer := 8;--Define quantidade de bits 
	p_tipo : string := "e" -- "e" para AND | "ou" para OR
);

	port (
		i_data1 : in std_logic_vector(p_data-1 downto 0);
		i_data2 : in std_logic_vector(p_data-1 downto 0);
		o_data : out std_logic_vector(p_data-1 downto 0);
		i_Clk : in std_logic;
		i_rst : in std_logic;
		i_en : in std_logic
	);
end and_or;

architecture behavioral of and_or is

begin

		process(i_clk)
		begin
			if rising_edge(i_clk) then
				if (i_rst = '0') then -- Se reset ativado, saida recebe todos 0
					o_data <= (others => '0');
				else
					if (i_en = '0') then -- Se enable ativado, e for selecionado um AND
						if (p_tipo = "e") then
							o_data <= (i_data1 and i_data2);
						elsif (p_tipo = "ou" ) then --  se for selecionado tipo OR
							o_data <= (i_data1 or i_data2);
						end if;
					end if;
				end if;
			end if;
		end process;	
end behavioral;		
	