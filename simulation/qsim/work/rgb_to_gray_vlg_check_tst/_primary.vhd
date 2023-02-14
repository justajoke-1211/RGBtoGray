library verilog;
use verilog.vl_types.all;
entity rgb_to_gray_vlg_check_tst is
    port(
        gray            : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end rgb_to_gray_vlg_check_tst;
