#!/bin/bash

DRIVENAME="$(grep ^drive-name /mnt/data/config/script.conf | cut -d= -f2-)"

if [ "${RCLONE_AUTO_MODE}" = "dummy" ]; then
    sed -i "s|MODE_STATUS|</b>|g" /.aria2allinoneworkdir/homer/assets/config.yml
elif [ "${RCLONE_AUTO_MODE}" = "move" ]; then
    sed -i "s|MODE_STATUS|<br />[move] 下载任务完成后移动到本地 finished 目录</b>|g" /.aria2allinoneworkdir/homer/assets/config.yml
elif [ "${RCLONE_AUTO_MODE}" = "custom" ]; then
    sed -i "s|MODE_STATUS|<br />Aria2自动化模式: [custom] 自定义</b>|g" /.aria2allinoneworkdir/homer/assets/config.yml
elif [ ! -f "/mnt/data/config/rclone.conf" ]; then
    sed -i "s|MODE_STATUS|<br />Aria2自动化模式:<br />未找到 Rclone 配置文件</b>|g" /.aria2allinoneworkdir/homer/assets/config.yml
elif [ "${RCLONE_AUTO_MODE}" = "copy_remote" ]; then
    sed -i "s|MODE_STATUS|<br />Aria2自动化模式:<br />[copy_remote] 下载及做种完成后移动到本地finished目录, 然后复制到Rclone远程存储${DRIVENAME}</b>|g" /.aria2allinoneworkdir/homer/assets/config.yml
elif [ "${RCLONE_AUTO_MODE}" = "copy_remote_first" ]; then
    sed -i "s|MODE_STATUS|<br />Aria2自动化模式:<br />[copy_remote_first] 下载完成后复制到Rclone远程存储${DRIVENAME}, BT任务在进入做种前触发上传</b>|g" /.aria2allinoneworkdir/homer/assets/config.yml
elif [ "${RCLONE_AUTO_MODE}" = "move_remote" ]; then
    sed -i "s|MODE_STATUS|<br />Aria2自动化模式:<br />[move_remote] 下载及做种完成后移动到本地finished目录, 然后移动到Rclone远程存储${DRIVENAME}</b>|g" /.aria2allinoneworkdir/homer/assets/config.yml
elif [ "${RCLONE_AUTO_MODE}" = "move_remote_only" ]; then
    sed -i "s|MODE_STATUS|<br />Aria2自动化模式:<br />[move_remote_only] 下载及做种完成后移动到Rclone远程存储${DRIVENAME}</b>|g" /.aria2allinoneworkdir/homer/assets/config.yml
fi
