# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\Jordan\OneDrive\College\WorkSpace\report4part3\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\Jordan\OneDrive\College\WorkSpace\report4part3\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {report4part3}\
-hw {C:\Users\Jordan\OneDrive\College\Engineering\System on Chip\Class Report 4\Class_report_4\report4part3.xsa}\
-proc {microblaze_I} -os {standalone} -out {C:/Users/Jordan/OneDrive/College/WorkSpace}

platform write
platform generate -domains 
platform active {report4part3}
platform generate
