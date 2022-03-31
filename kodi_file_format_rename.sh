#########################################################################
# rename files downloaded that are long and can be split on a delimiter #
#########################################################################

# e.g. file1 1972 S01E01-xxx.mp4
# required output; file1 (1972) S01E01.mp4
# note the parenthesis around year in output

#!/bin/bash

# don't use command substitution - complicates the spaces in file names
# don't do this - for i in $(ls *.mp4)

for i in *.mp4
do

# tr -d \' removes any quotes that may srround file names
# sed wraps parenthesis around the date in the file name

new_filename=$(echo "${i}" | cut -d "-" -f1 | tr -d \' | sed 's/1972/(1972)/')".mp4"
cp "${i}" "${new_filename}"
done
