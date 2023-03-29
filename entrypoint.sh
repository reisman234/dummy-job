#!/bin/sh

sleeptime="${SLEEPTIME:-10}"
if [[ -z "$SOURCE" || -z "$DESTINATION" ]]; then
    echo "FAIL: SOURCE or DESTINATION unset"
    exit 1
fi


if [[ ! -f "$SOURCE" ]]; then
    echo "FAIL: SOURCE not existst"
    exit 1
fi

stop_time=$(date --date="$sleeptime seconds" +%s)
now=0;

while [ "$now" -lt "$stop_time" ]
do
    now=$(date +%s)
    echo "$(date --date=@$now '+%F %T' ): work until $(date --date=@$stop_time '+%F %T')"
    sleep 1;
done

mv -v $SOURCE $DESTINATION

exit 0
