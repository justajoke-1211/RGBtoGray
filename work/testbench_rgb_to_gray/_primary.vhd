library verilog;
use verilog.vl_types.all;
entity testbench_rgb_to_gray is
    generic(
        HEIGHT_RGB      : integer := 1153;
        WIDTH_RGB       : integer := 2048;
        CHANNEL_RGB     : integer := 3
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of HEIGHT_RGB : constant is 1;
    attribute mti_svvh_generic_type of WIDTH_RGB : constant is 1;
    attribute mti_svvh_generic_type of CHANNEL_RGB : constant is 1;
end testbench_rgb_to_gray;
