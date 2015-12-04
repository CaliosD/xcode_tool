#! /bin/bash

# 使用方法： ./count_code_line.sh your_project_dir

find -s $1 "(" -name "*.m" -or -name "*.mm" -or -name "*.cpp" -or -name "*.h" -or -name "*.rss" ")" -print | xargs wc -l

