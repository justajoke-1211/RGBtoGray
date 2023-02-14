library verilog;
use verilog.vl_types.all;
entity rgb_to_gray_controller is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        out_e           : out    vl_logic;
        done            : out    vl_logic
    );
end rgb_to_gray_controller;
