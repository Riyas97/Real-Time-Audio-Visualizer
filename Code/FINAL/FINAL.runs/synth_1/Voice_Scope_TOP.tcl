# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/achin/Desktop/EE2026/FINAL/FINAL.cache/wt [current_project]
set_property parent.project_path C:/Users/achin/Desktop/EE2026/FINAL/FINAL.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/achin/Desktop/EE2026/FINAL/FINAL.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  {C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/FOR EE2026/2Display1.v}
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/Desktop/Draw_Background.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/new/Draw_Pong.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/Desktop/Draw_Waveform.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/new/Introduction.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/sources_1/new/TestWave_Gen.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/sources_1/imports/new/VGA_DISPLAY.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/sources_1/imports/new/VOICE_CAPTURER.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/new/bar_graph.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/new/bitmap.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/Desktop/clk_div.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/new/color_maker.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/sources_1/new/color_select.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/sources_1/new/debounce.v
  {C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/FOR EE2026/display1.v}
  {C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/FOR EE2026/display3.v}
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/new/draw_circle.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/new/full1.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/new/full2.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/new/full3.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/new/full4.v
  {C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/FOR EE2026/horiz_display1.v}
  {C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/FOR EE2026/horiz_display2.v}
  {C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/FOR EE2026/line_graph2.v}
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/new/menu.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/new/menu_logic.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/new/menu_pong.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/sources_1/new/my_dff.v
  {C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/FOR EE2026/real_draw.v}
  {C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/FOR EE2026/real_drawx3.v}
  {C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/FOR EE2026/real_drawx4.v}
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/new/score_map.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/new/sev_seg.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/sources_1/new/single_pulse.v
  {C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/FOR EE2026/slow_background2.v}
  {C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/FOR EE2026/slow_wave.v}
  {C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/FOR EE2026/slow_waveform.v}
  {C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/FOR EE2026/slow_waveform2.v}
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/new/string_map.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/new/vertical2.v
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/new/vol_indi.v
  {C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/FOR EE2026/volume_indicate.v}
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/Desktop/Voice_Scope_TOP.v
}
read_vhdl -library xil_defaultlib {
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/sources_1/imports/new/CLK_108M.vhd
  C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/sources_1/imports/sources_1/imports/new/VGA_CONTROL.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/constrs_1/imports/Desktop/Basys3_Master.xdc
set_property used_in_implementation false [get_files C:/Users/achin/Desktop/EE2026/FINAL/FINAL.srcs/constrs_1/imports/Desktop/Basys3_Master.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top Voice_Scope_TOP -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Voice_Scope_TOP.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Voice_Scope_TOP_utilization_synth.rpt -pb Voice_Scope_TOP_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
