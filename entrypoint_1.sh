#!/bin/sh

set -x
shopt -s nullglob
data_dir="${DATA_DIR:-data/arch_dir}"

echo "__ LIST CONTENT OF: ${data_dir} __" > "${DESTINATION}"
ls -l "${data_dir}" | tail -n +2 >> "${DESTINATION}"
echo ""
echo "__ LIST FILE CONTENT OF: ${data_dir}/* __" >> "${DESTINATION}"
cat "${data_dir}"/* >> "${DESTINATION}"
