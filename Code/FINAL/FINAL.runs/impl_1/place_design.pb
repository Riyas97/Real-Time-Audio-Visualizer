
Q
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px? 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
22default:defaultZ30-611h px? 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px? 
?

Phase %s%s
101*constraints2
1.1 2default:default29
%Placer Initialization Netlist Sorting2default:defaultZ18-101h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0332default:default2
1180.7382default:default2
0.0002default:defaultZ17-268h px? 
Z
EPhase 1.1 Placer Initialization Netlist Sorting | Checksum: c1d5b16b
*commonh px? 
?

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.039 . Memory (MB): peak = 1180.738 ; gain = 0.0002default:defaulth px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:012default:default2 
00:00:00.0302default:default2
1180.7382default:default2
0.0002default:defaultZ17-268h px? 
?

Phase %s%s
101*constraints2
1.2 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
h
SPhase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: 16b2a0bbf
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:06 ; elapsed = 00:00:03 . Memory (MB): peak = 1200.047 ; gain = 19.3092default:defaulth px? 
}

Phase %s%s
101*constraints2
1.3 2default:default2.
Build Placer Netlist Model2default:defaultZ18-101h px? 
P
;Phase 1.3 Build Placer Netlist Model | Checksum: 17f2ec7dd
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:13 ; elapsed = 00:00:08 . Memory (MB): peak = 1319.703 ; gain = 138.9652default:defaulth px? 
z

Phase %s%s
101*constraints2
1.4 2default:default2+
Constrain Clocks/Macros2default:defaultZ18-101h px? 
M
8Phase 1.4 Constrain Clocks/Macros | Checksum: 17f2ec7dd
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:13 ; elapsed = 00:00:08 . Memory (MB): peak = 1319.703 ; gain = 138.9652default:defaulth px? 
I
4Phase 1 Placer Initialization | Checksum: 17f2ec7dd
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:13 ; elapsed = 00:00:09 . Memory (MB): peak = 1319.703 ; gain = 138.9652default:defaulth px? 
q

Phase %s%s
101*constraints2
2 2default:default2$
Global Placement2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
2.1 2default:default2!
Floorplanning2default:defaultZ18-101h px? 
C
.Phase 2.1 Floorplanning | Checksum: 25341b8fe
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:15 ; elapsed = 00:00:09 . Memory (MB): peak = 1319.703 ; gain = 138.9652default:defaulth px? 


Phase %s%s
101*constraints2
2.2 2default:default20
Physical Synthesis In Placer2default:defaultZ18-101h px? 
?
=Pass %s. Identified %s candidate %s for fanout optimization.
76*physynth2
12default:default2
22default:default2
nets2default:defaultZ32-76h px? 
?
+Net %s was not replicated. - no resolution
314*physynth2@
g/VGA_CONTROL/out[0]g/VGA_CONTROL/out[0]2default:default8Z32-571h px? 
?
+Net %s was not replicated. - no resolution
314*physynth2@
g/VGA_CONTROL/out[3]g/VGA_CONTROL/out[3]2default:default8Z32-571h px? 
?
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
?
=Pass %s. Identified %s candidate %s for fanout optimization.
76*physynth2
12default:default2
72default:default2
nets2default:defaultZ32-76h px? 
?
'Processed net %s. Replicated %s times.
81*physynth2N
g/VGA_CONTROL/circle12__0_0g/VGA_CONTROL/circle12__0_02default:default2
82default:default8Z32-81h px? 
?
'Processed net %s. Replicated %s times.
81*physynth2N
g/VGA_CONTROL/circle12__0_2g/VGA_CONTROL/circle12__0_22default:default2
92default:default8Z32-81h px? 
?
'Processed net %s. Replicated %s times.
81*physynth2N
g/VGA_CONTROL/circle12_2[0]g/VGA_CONTROL/circle12_2[0]2default:default2
52default:default8Z32-81h px? 
?
'Processed net %s. Replicated %s times.
81*physynth2H
g/VGA_CONTROL/circle12_0g/VGA_CONTROL/circle12_02default:default2
72default:default8Z32-81h px? 
?
'Processed net %s. Replicated %s times.
81*physynth2N
g/VGA_CONTROL/circle12__0_3g/VGA_CONTROL/circle12__0_32default:default2
92default:default8Z32-81h px? 
?
'Processed net %s. Replicated %s times.
81*physynth2N
g/VGA_CONTROL/circle12__0_1g/VGA_CONTROL/circle12__0_12default:default2
72default:default8Z32-81h px? 
?
'Processed net %s. Replicated %s times.
81*physynth2N
g/VGA_CONTROL/circle12__0_4g/VGA_CONTROL/circle12__0_42default:default2
92default:default8Z32-81h px? 
?
$Optimized %s %s. Created %s new %s.
216*physynth2
72default:default2
nets2default:default2
542default:default2
	instances2default:defaultZ32-232h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
72default:default2!
nets or cells2default:default2
542default:default2
cells2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0922default:default2
1319.7032default:default2
0.0002default:defaultZ17-268h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0302default:default2
1319.7032default:default2
0.0002default:defaultZ17-268h px? 
B
-
Summary of Physical Synthesis Optimizations
*commonh px? 
B
-============================================
*commonh px? 


*commonh px? 


*commonh px? 
?
~-----------------------------------------------------------------------------------------------------------------------------
*commonh px? 
?
?|  Optimization       |  Added Cells  |  Removed Cells  |  Optimized Cells/Nets  |  Dont Touch  |  Iterations  |  Elapsed   |
-----------------------------------------------------------------------------------------------------------------------------
*commonh px? 
?
?|  Very High Fanout   |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Fanout             |           54  |              0  |                     7  |           0  |           1  |  00:00:07  |
|  Total              |           54  |              0  |                     7  |           0  |           2  |  00:00:08  |
-----------------------------------------------------------------------------------------------------------------------------
*commonh px? 


*commonh px? 


*commonh px? 
R
=Phase 2.2 Physical Synthesis In Placer | Checksum: 2adae6f9f
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:56 ; elapsed = 00:00:37 . Memory (MB): peak = 1319.703 ; gain = 138.9652default:defaulth px? 
D
/Phase 2 Global Placement | Checksum: 1ea90e3c4
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:57 ; elapsed = 00:00:38 . Memory (MB): peak = 1319.703 ; gain = 138.9652default:defaulth px? 
q

Phase %s%s
101*constraints2
3 2default:default2$
Detail Placement2default:defaultZ18-101h px? 
}

Phase %s%s
101*constraints2
3.1 2default:default2.
Commit Multi Column Macros2default:defaultZ18-101h px? 
P
;Phase 3.1 Commit Multi Column Macros | Checksum: 1ea90e3c4
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:57 ; elapsed = 00:00:38 . Memory (MB): peak = 1319.703 ; gain = 138.9652default:defaulth px? 


Phase %s%s
101*constraints2
3.2 2default:default20
Commit Most Macros & LUTRAMs2default:defaultZ18-101h px? 
R
=Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 1247fd653
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:05 ; elapsed = 00:00:44 . Memory (MB): peak = 1319.703 ; gain = 138.9652default:defaulth px? 
y

Phase %s%s
101*constraints2
3.3 2default:default2*
Area Swap Optimization2default:defaultZ18-101h px? 
L
7Phase 3.3 Area Swap Optimization | Checksum: 1f55707ee
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:05 ; elapsed = 00:00:44 . Memory (MB): peak = 1319.703 ; gain = 138.9652default:defaulth px? 
?

Phase %s%s
101*constraints2
3.4 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px? 
T
?Phase 3.4 Pipeline Register Optimization | Checksum: 20bedc5ad
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:05 ; elapsed = 00:00:45 . Memory (MB): peak = 1319.703 ; gain = 138.9652default:defaulth px? 
x

Phase %s%s
101*constraints2
3.5 2default:default2)
Timing Path Optimizer2default:defaultZ18-101h px? 
K
6Phase 3.5 Timing Path Optimizer | Checksum: 20bedc5ad
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:05 ; elapsed = 00:00:45 . Memory (MB): peak = 1319.703 ; gain = 138.9652default:defaulth px? 
t

Phase %s%s
101*constraints2
3.6 2default:default2%
Fast Optimization2default:defaultZ18-101h px? 
G
2Phase 3.6 Fast Optimization | Checksum: 1b932e988
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:11 ; elapsed = 00:00:51 . Memory (MB): peak = 1319.703 ; gain = 138.9652default:defaulth px? 


Phase %s%s
101*constraints2
3.7 2default:default20
Small Shape Detail Placement2default:defaultZ18-101h px? 
R
=Phase 3.7 Small Shape Detail Placement | Checksum: 24c112d23
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:14 ; elapsed = 00:00:54 . Memory (MB): peak = 1319.703 ; gain = 138.9652default:defaulth px? 
u

Phase %s%s
101*constraints2
3.8 2default:default2&
Re-assign LUT pins2default:defaultZ18-101h px? 
H
3Phase 3.8 Re-assign LUT pins | Checksum: 2461d34b9
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:15 ; elapsed = 00:00:55 . Memory (MB): peak = 1319.703 ; gain = 138.9652default:defaulth px? 
?

Phase %s%s
101*constraints2
3.9 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px? 
T
?Phase 3.9 Pipeline Register Optimization | Checksum: 2461d34b9
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:15 ; elapsed = 00:00:55 . Memory (MB): peak = 1319.703 ; gain = 138.9652default:defaulth px? 
u

Phase %s%s
101*constraints2
3.10 2default:default2%
Fast Optimization2default:defaultZ18-101h px? 
H
3Phase 3.10 Fast Optimization | Checksum: 27e7a7b4d
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:36 ; elapsed = 00:01:11 . Memory (MB): peak = 1319.703 ; gain = 138.9652default:defaulth px? 
D
/Phase 3 Detail Placement | Checksum: 27e7a7b4d
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:37 ; elapsed = 00:01:11 . Memory (MB): peak = 1319.703 ; gain = 138.9652default:defaulth px? 
?

Phase %s%s
101*constraints2
4 2default:default2<
(Post Placement Optimization and Clean-Up2default:defaultZ18-101h px? 
{

Phase %s%s
101*constraints2
4.1 2default:default2,
Post Commit Optimization2default:defaultZ18-101h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
?

Phase %s%s
101*constraints2
4.1.1 2default:default2/
Post Placement Optimization2default:defaultZ18-101h px? 
V
APost Placement Optimization Initialization | Checksum: 1f2a94e88
*commonh px? 
u

Phase %s%s
101*constraints2
4.1.1.1 2default:default2"
BUFG Insertion2default:defaultZ18-101h px? 
?
?BUFG insertion identified %s candidate nets, %s success, %s skipped for placement/routing, %s skipped for timing, %s skipped for netlist change reason.30*	placeflow2
02default:default2
02default:default2
02default:default2
02default:default2
02default:defaultZ46-31h px? 
H
3Phase 4.1.1.1 BUFG Insertion | Checksum: 1f2a94e88
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:44 ; elapsed = 00:01:16 . Memory (MB): peak = 1340.602 ; gain = 159.8632default:defaulth px? 
?
hPost Placement Timing Summary WNS=%s. For the most accurate timing information please run report_timing.610*place2
-16.4312default:defaultZ30-746h px? 
S
>Phase 4.1.1 Post Placement Optimization | Checksum: 17d9d3c8c
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:02:01 ; elapsed = 00:01:29 . Memory (MB): peak = 1341.609 ; gain = 160.8712default:defaulth px? 
N
9Phase 4.1 Post Commit Optimization | Checksum: 17d9d3c8c
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:02:01 ; elapsed = 00:01:29 . Memory (MB): peak = 1341.609 ; gain = 160.8712default:defaulth px? 
y

Phase %s%s
101*constraints2
4.2 2default:default2*
Post Placement Cleanup2default:defaultZ18-101h px? 
L
7Phase 4.2 Post Placement Cleanup | Checksum: 17d9d3c8c
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:02:01 ; elapsed = 00:01:29 . Memory (MB): peak = 1341.609 ; gain = 160.8712default:defaulth px? 
s

Phase %s%s
101*constraints2
4.3 2default:default2$
Placer Reporting2default:defaultZ18-101h px? 
F
1Phase 4.3 Placer Reporting | Checksum: 17d9d3c8c
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:02:01 ; elapsed = 00:01:30 . Memory (MB): peak = 1341.609 ; gain = 160.8712default:defaulth px? 
z

Phase %s%s
101*constraints2
4.4 2default:default2+
Final Placement Cleanup2default:defaultZ18-101h px? 
L
7Phase 4.4 Final Placement Cleanup | Checksum: ecb0a2cb
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:02:01 ; elapsed = 00:01:30 . Memory (MB): peak = 1341.609 ; gain = 160.8712default:defaulth px? 
[
FPhase 4 Post Placement Optimization and Clean-Up | Checksum: ecb0a2cb
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:02:01 ; elapsed = 00:01:30 . Memory (MB): peak = 1341.609 ; gain = 160.8712default:defaulth px? 
=
(Ending Placer Task | Checksum: 233a8176
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:02:01 ; elapsed = 00:01:30 . Memory (MB): peak = 1341.609 ; gain = 160.8712default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
602default:default2
02default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
place_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
place_design: 2default:default2
00:02:042default:default2
00:01:312default:default2
1341.6092default:default2
160.8712default:defaultZ17-268h px? 
H
&Writing timing data to binary archive.266*timingZ38-480h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:032default:default2
00:00:012default:default2
1341.6092default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2d
PC:/Users/achin/Desktop/EE2026/FINAL/FINAL.runs/impl_1/Voice_Scope_TOP_placed.dcp2default:defaultZ17-1381h px? 
j
%s4*runtcl2N
:Executing : report_io -file Voice_Scope_TOP_io_placed.rpt
2default:defaulth px? 
?
kreport_io: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.053 . Memory (MB): peak = 1341.609 ; gain = 0.000
*commonh px? 
?
%s4*runtcl2?
vExecuting : report_utilization -file Voice_Scope_TOP_utilization_placed.rpt -pb Voice_Scope_TOP_utilization_placed.pb
2default:defaulth px? 
?
treport_utilization: Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.224 . Memory (MB): peak = 1341.609 ; gain = 0.000
*commonh px? 
?
%s4*runtcl2k
WExecuting : report_control_sets -verbose -file Voice_Scope_TOP_control_sets_placed.rpt
2default:defaulth px? 
?
ureport_control_sets: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.154 . Memory (MB): peak = 1341.609 ; gain = 0.000
*commonh px? 


End Record