library verilog;
use verilog.vl_types.all;
entity rgb_to_gray_vlg_sample_tst is
    port(
        B               : in     vl_logic_vector(7 downto 0);
        G               : in     vl_logic_vector(7 downto 0);
        R               : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end rgb_to_gray_vlg_sample_tst;
