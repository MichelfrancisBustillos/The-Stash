#!/bin/bash
set -o noclobber
push_url="https://status.katoteros.org/api/push/B10bmqKhpL?"

echo "Backing up RAID Array to External Drive. DO NOT TOUCH!"

echo "Backup Started at $(date)" >> /home/hb/backupLog.txt
echo "Backup Started at $(date)"

/usr/bin/python3 /home/hb/bootlace/bootlace.py -m "HB Nas Backup Started" -t a3sohs7vnygx8z5irx7t83cfmmxzhg -u gjb84tfd7mhubz7uvgh6t5rmue8ari -d "HB NAS" -T "HB NAS"

rm -f /mnt/BackupDrive/backupLog.txt

sudo mount -a
if grep -qs '/mnt/BackupDrive ' /proc/mounts
then
        echo "Backup Drive mounted successfully!" >> /home/hb/backupLog.txt
        echo "Backup Drive mounted successfully!"
else
        /usr/bin/python3 /home/hb/bootlace/bootlace.py -m "HB NAS Backup Drive NOT MOUNTED" -t a3sohs7vnygx8z5irx7t83cfmmxzhg -u "HB NAS" -T "HB NAS"
        curl \
			--get \
			--data-urlencode "status=down" \
			--data-urlencode "msg=HB NAS Backup Drive NOT MOUNTED" \
			--data-urlencode "ping=100" \
			--silent \
			${push_url} \
			> /dev/null
		echo "Backup Drive NOT MOUNTED!" >> /home/hb/backupLog.txt
        echo "Backup Drive NOT MOUNTED!"
        exit 1
fi

sudo rsync -ahP --delete --info=progress2 /srv/ /mnt/BackupDrive --log-file=/mnt/BackupDrive/backupLog.txt

if [[ $? -gt 0 ]]
then
        /usr/bin/python3 /home/hb/bootlace/bootlace.py -m "HB Nas Backup FAILED" -t a3sohs7vnygx8z5irx7t83cfmmxzhg -u gjb84tfd7mhubz7uvgh6t5rmue8ari -d "HB NAS" -T "HB NAS"
		curl \
			--get \
			--data-urlencode "status=down" \
			--data-urlencode "msg=HB NAS Backup FAILED" \
			--data-urlencode "ping=50" \
			--silent \
			${push_url} \
			> /dev/null
		echo "Backup Failed at $(date) with exit code $?" >> /home/hb/backupLog.txt
        echo "Backup Failed at $(date) with exit code $?"
else
        /usr/bin/python3 /home/hb/bootlace/bootlace.py -m "HB Nas Backup Successful" -t a3sohs7vnygx8z5irx7t83cfmmxzhg -u gjb84tfd7mhubz7uvgh6t5rmue8ari -d "HB NAS" -T "HB NAS"
		curl \
			--get \
			--data-urlencode "status=up" \
			--data-urlencode "msg=HB NAS Backup Successful" \
			--data-urlencode "ping=0" \
			--silent \
			${push_url} \
			> /dev/null
		echo "Backup Succeeded at $(date) with exit code $?" >> /home/hb/backupLog.txt
        echo "Backup Succeeded at $(date) with exit code $?"
fi

echo ">>>" >> /home/hb/backupLog.txt
