# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\Jordan\workspace\report3\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\Jordan\workspace\report3\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {report3}\
-hw {C:\Users\Jordan\OneDrive\College\Engineering\System on Chip\FPGA_vanilla\report3.xsa}\
-proc {microblaze_I} -os {standalone} -out {C:/Users/Jordan/workspace}

platform write
platform generate -domains 
platform active {report3}
platform active {report3}
platform generate
