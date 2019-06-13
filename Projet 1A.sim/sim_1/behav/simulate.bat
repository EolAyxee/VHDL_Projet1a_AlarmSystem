@echo off
set xv_path=D:\\Programmes\\Vivado\\Vivado\\2017.2\\bin
call %xv_path%/xsim Assemble_Code_tb_behav -key {Behavioral:sim_1:Functional:Assemble_Code_tb} -tclbatch Assemble_Code_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
