#!/usr/bin/env bash

logfile="${1}"
if [ -z "${1}" ]; then
    echo "Usage: ./dirtylog.sh <logfile.log.gz>"; exit 1
fi

Reg_GuiNewChat="\[main\/INFO\]\ \[net.minecraft.client.gui.GuiNewChat\]:\ "
Replace_GuiNewChat="s/${Reg_GuiNewChat}\[CHAT\]\ //g"

Replace_NarratorLinux="/\[main\/WARN\]\ \[com.mojang.text2speech.NarratorLinux\]/d"
Replace_UnknownEntity="/Received\ passengers\ for\ unknown\ entity/d"

zcat ${logfile} | \
    sed -r "${Replace_GuiNewChat}"          | \
    sed -r "${Replace_NarratorLinux}"       | \
    sed -r "${Replace_UnknownEntity}"       | \
    # cat > tmp.txt
    gzip > "tmp.log.gz"
