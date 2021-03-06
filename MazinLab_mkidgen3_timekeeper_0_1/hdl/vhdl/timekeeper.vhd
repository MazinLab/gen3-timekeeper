-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2019.2.1
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity timekeeper is
generic (
    C_S_AXI_AXILITES_ADDR_WIDTH : INTEGER := 6;
    C_S_AXI_AXILITES_DATA_WIDTH : INTEGER := 32 );
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    pps : IN STD_LOGIC;
    time_V : OUT STD_LOGIC_VECTOR (63 downto 0);
    time_V_ap_vld : OUT STD_LOGIC;
    s_axi_AXILiteS_AWVALID : IN STD_LOGIC;
    s_axi_AXILiteS_AWREADY : OUT STD_LOGIC;
    s_axi_AXILiteS_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_AXILITES_ADDR_WIDTH-1 downto 0);
    s_axi_AXILiteS_WVALID : IN STD_LOGIC;
    s_axi_AXILiteS_WREADY : OUT STD_LOGIC;
    s_axi_AXILiteS_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_AXILITES_DATA_WIDTH-1 downto 0);
    s_axi_AXILiteS_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_AXILITES_DATA_WIDTH/8-1 downto 0);
    s_axi_AXILiteS_ARVALID : IN STD_LOGIC;
    s_axi_AXILiteS_ARREADY : OUT STD_LOGIC;
    s_axi_AXILiteS_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_AXILITES_ADDR_WIDTH-1 downto 0);
    s_axi_AXILiteS_RVALID : OUT STD_LOGIC;
    s_axi_AXILiteS_RREADY : IN STD_LOGIC;
    s_axi_AXILiteS_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_AXILITES_DATA_WIDTH-1 downto 0);
    s_axi_AXILiteS_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_AXILiteS_BVALID : OUT STD_LOGIC;
    s_axi_AXILiteS_BREADY : IN STD_LOGIC;
    s_axi_AXILiteS_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    ctrl_clk : IN STD_LOGIC;
    ap_rst_n_ctrl_clk : IN STD_LOGIC );
end;


architecture behav of timekeeper is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "timekeeper,hls_ip_2019_2_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xczu28dr-ffvg1517-2-e,HLS_INPUT_CLOCK=1.818000,HLS_INPUT_ARCH=pipeline,HLS_SYN_CLOCK=3.085000,HLS_SYN_LAT=2,HLS_SYN_TPT=1,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=393,HLS_SYN_LUT=534,HLS_VERSION=2019_2_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv30_0 : STD_LOGIC_VECTOR (29 downto 0) := "000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv30_1E848000 : STD_LOGIC_VECTOR (29 downto 0) := "011110100001001000000000000000";
    constant ap_const_lv30_1 : STD_LOGIC_VECTOR (29 downto 0) := "000000000000000000000000000001";
    constant ap_const_lv64_1 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000001";
    constant ap_const_lv64_14 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000010100";

    signal ap_rst_n_inv : STD_LOGIC;
    signal unixtime_V_i : STD_LOGIC_VECTOR (63 downto 0);
    signal unixtime_V_o : STD_LOGIC_VECTOR (63 downto 0);
    signal unixtime_V_o_ap_vld : STD_LOGIC;
    signal counter_V : STD_LOGIC_VECTOR (29 downto 0) := "000000000000000000000000000000";
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal ap_rst_n_ctrl_clk_inv : STD_LOGIC;
    signal t_V_1_reg_136 : STD_LOGIC_VECTOR (29 downto 0);
    signal t_V_1_reg_136_pp0_iter1_reg : STD_LOGIC_VECTOR (29 downto 0);
    signal or_ln10_fu_84_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln10_reg_141 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln10_reg_141_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal t_V_reg_145 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln700_fu_108_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln700_reg_150 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal add_ln700_1_fu_90_p2 : STD_LOGIC_VECTOR (29 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal add_ln209_fu_123_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal r_V_fu_130_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln879_fu_78_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln10_fu_84_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal r_V_1_fu_115_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln209_fu_120_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_condition_100 : BOOLEAN;

    component timekeeper_AXILiteS_s_axi IS
    generic (
        C_S_AXI_ADDR_WIDTH : INTEGER;
        C_S_AXI_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        unixtime_V_o : IN STD_LOGIC_VECTOR (63 downto 0);
        unixtime_V_o_ap_vld : IN STD_LOGIC;
        unixtime_V_i : OUT STD_LOGIC_VECTOR (63 downto 0);
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC );
    end component;



begin
    timekeeper_AXILiteS_s_axi_U : component timekeeper_AXILiteS_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_AXILITES_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_AXILITES_DATA_WIDTH)
    port map (
        AWVALID => s_axi_AXILiteS_AWVALID,
        AWREADY => s_axi_AXILiteS_AWREADY,
        AWADDR => s_axi_AXILiteS_AWADDR,
        WVALID => s_axi_AXILiteS_WVALID,
        WREADY => s_axi_AXILiteS_WREADY,
        WDATA => s_axi_AXILiteS_WDATA,
        WSTRB => s_axi_AXILiteS_WSTRB,
        ARVALID => s_axi_AXILiteS_ARVALID,
        ARREADY => s_axi_AXILiteS_ARREADY,
        ARADDR => s_axi_AXILiteS_ARADDR,
        RVALID => s_axi_AXILiteS_RVALID,
        RREADY => s_axi_AXILiteS_RREADY,
        RDATA => s_axi_AXILiteS_RDATA,
        RRESP => s_axi_AXILiteS_RRESP,
        BVALID => s_axi_AXILiteS_BVALID,
        BREADY => s_axi_AXILiteS_BREADY,
        BRESP => s_axi_AXILiteS_BRESP,
        ACLK => ctrl_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        unixtime_V_o => unixtime_V_o,
        unixtime_V_o_ap_vld => unixtime_V_o_ap_vld,
        unixtime_V_i => unixtime_V_i,
        clk => ap_clk,
        rst => ap_rst_n_ctrl_clk_inv);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    counter_V_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_100)) then
                if ((or_ln10_fu_84_p2 = ap_const_lv1_1)) then 
                    counter_V <= ap_const_lv30_0;
                elsif ((or_ln10_fu_84_p2 = ap_const_lv1_0)) then 
                    counter_V <= add_ln700_1_fu_90_p2;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((or_ln10_reg_141 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                add_ln700_reg_150 <= add_ln700_fu_108_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                or_ln10_reg_141 <= or_ln10_fu_84_p2;
                or_ln10_reg_141_pp0_iter1_reg <= or_ln10_reg_141;
                t_V_1_reg_136 <= counter_V;
                t_V_1_reg_136_pp0_iter1_reg <= t_V_1_reg_136;
                t_V_reg_145 <= unixtime_V_i;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_block_pp0_stage0_subdone, ap_reset_idle_pp0)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln209_fu_123_p2 <= std_logic_vector(unsigned(r_V_1_fu_115_p2) + unsigned(zext_ln209_fu_120_p1));
    add_ln700_1_fu_90_p2 <= std_logic_vector(unsigned(ap_const_lv30_1) + unsigned(counter_V));
    add_ln700_fu_108_p2 <= std_logic_vector(unsigned(ap_const_lv64_1) + unsigned(unixtime_V_i));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_100_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
                ap_condition_100 <= ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0));
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_const_logic_1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_reset_idle_pp0 <= ap_const_logic_0;

    ap_rst_n_ctrl_clk_inv_assign_proc : process(ap_rst_n_ctrl_clk)
    begin
                ap_rst_n_ctrl_clk_inv <= not(ap_rst_n_ctrl_clk);
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    icmp_ln879_fu_78_p2 <= "1" when (counter_V = ap_const_lv30_1E848000) else "0";
    or_ln10_fu_84_p1 <= (0=>pps, others=>'-');
    or_ln10_fu_84_p2 <= (or_ln10_fu_84_p1 or icmp_ln879_fu_78_p2);
    r_V_1_fu_115_p2 <= std_logic_vector(shift_left(unsigned(t_V_reg_145),to_integer(unsigned('0' & ap_const_lv64_14(31-1 downto 0)))));
    r_V_fu_130_p2 <= std_logic_vector(shift_left(unsigned(add_ln700_reg_150),to_integer(unsigned('0' & ap_const_lv64_14(31-1 downto 0)))));

    time_V_assign_proc : process(or_ln10_reg_141_pp0_iter1_reg, ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_01001, add_ln209_fu_123_p2, r_V_fu_130_p2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001))) then
            if ((or_ln10_reg_141_pp0_iter1_reg = ap_const_lv1_1)) then 
                time_V <= r_V_fu_130_p2;
            elsif ((or_ln10_reg_141_pp0_iter1_reg = ap_const_lv1_0)) then 
                time_V <= add_ln209_fu_123_p2;
            else 
                time_V <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            time_V <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    time_V_ap_vld_assign_proc : process(ap_block_pp0_stage0_11001, or_ln10_reg_141_pp0_iter1_reg, ap_enable_reg_pp0_iter2)
    begin
        if ((((or_ln10_reg_141_pp0_iter1_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((or_ln10_reg_141_pp0_iter1_reg = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)))) then 
            time_V_ap_vld <= ap_const_logic_1;
        else 
            time_V_ap_vld <= ap_const_logic_0;
        end if; 
    end process;


    unixtime_V_o_assign_proc : process(unixtime_V_i, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, or_ln10_reg_141, add_ln700_fu_108_p2, ap_block_pp0_stage0_01001)
    begin
        if (((or_ln10_reg_141 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001))) then 
            unixtime_V_o <= add_ln700_fu_108_p2;
        else 
            unixtime_V_o <= unixtime_V_i;
        end if; 
    end process;


    unixtime_V_o_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001, or_ln10_reg_141)
    begin
        if (((or_ln10_reg_141 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            unixtime_V_o_ap_vld <= ap_const_logic_1;
        else 
            unixtime_V_o_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    zext_ln209_fu_120_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(t_V_1_reg_136_pp0_iter1_reg),64));
end behav;
