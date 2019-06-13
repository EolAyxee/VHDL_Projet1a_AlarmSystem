@echo off
set xv_path=D:\\Programmes\\Vivado\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto c1fb309a8d1546bda5550d8a3ae34202 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Assemble_Code_tb_behav xil_defaultlib.Assemble_Code_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
