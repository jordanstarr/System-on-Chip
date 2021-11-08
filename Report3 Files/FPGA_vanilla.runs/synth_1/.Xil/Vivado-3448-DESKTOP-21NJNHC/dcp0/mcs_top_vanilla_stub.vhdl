-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mcs_top_vanilla is
  Port ( 
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    sw : in STD_LOGIC_VECTOR ( 15 downto 0 );
    led : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rx : in STD_LOGIC;
    tx : out STD_LOGIC
  );

end mcs_top_vanilla;

architecture stub of mcs_top_vanilla is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
begin
end;
