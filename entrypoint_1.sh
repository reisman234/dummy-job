#!/bin/sh

shopt -s nullglob
data_dir="${DATA_DIR:-data/arch_dir}"

sleeptime="${SLEEPTIME:-10}"
stop_time=$(date --date="$sleeptime seconds" +%s)
now=0;
while [ "$now" -lt "$stop_time" ]
do
    now=$(date +%s)
    echo "$(date --date=@$now '+%F %T' ): work until $(date --date=@$stop_time '+%F %T')"
    sleep 1;
done

echo "__ LIST CONTENT OF: ${data_dir} __" > "${DESTINATION}"
ls -l "${data_dir}" | tail -n +2 >> "${DESTINATION}"
echo ""
echo "__ LIST FILE CONTENT OF: ${data_dir}/* __" >> "${DESTINATION}"
cat "${data_dir}"/* >> "${DESTINATION}"

data_file="/data/input_testfile"
if [ -e "$data_file" ]
then
    echo >> "${DESTINATION}"
    echo "__ CONTENT OF: ${data_file} __" >> "${DESTINATION}"
    cat "$data_file" >> "${DESTINATION}"
fi