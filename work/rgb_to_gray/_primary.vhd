library verilog;
use verilog.vl_types.all;
entity rgb_to_gray is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        R               : in     vl_logic_vector(7 downto 0);
        G               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0);
        done            : out    vl_logic
    );
end rgb_to_gray;
