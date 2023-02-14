library verilog;
use verilog.vl_types.all;
entity rgb_to_gray is
    port(
        R               : in     vl_logic_vector(7 downto 0);
        G               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        gray            : out    vl_logic_vector(7 downto 0)
    );
end rgb_to_gray;
