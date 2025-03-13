#!/bin/bash

BACKUP_DIR="../../study"
BACKUP_DEST="./backup"
LOG_FILE="./back.log"
DATE=$(date +%Y%m%d)

#创建压缩包,名字附带日期,并且将错误日志打印到日志文件中 2>>$LOC_FILE 代表stderr内容追加到 LOG_FILE 
tar -czf $BACKUP_DEST/backup_$DATE.tar.gz $BACKUP_DIR 2>>$LOG_FILE


#找到之前7天前的旧备份删除
find $BACKUP_DIR -name "backup_*.tar.gz" -mtime +7 -delete


if [ $? -eq 0 ];	then
	echo "[SUCCESS] Backup completed at $(date)" >> $LOG_FILE
else
	echo "[ERROR] Backup failed at $(date)" >> $LOG_FILE
fi



