#!/bin/bash

ADDED_DAYS=0
if [[ "$1" != "" ]]; then
    ADDED_DAYS=$1
fi

CURRENT_DATE="$(date +%Y-%m-%d)"

TARGET_DATE=$(date "+%Y-%m-%d" -d "$CURRENT_DATE + $ADDED_DAYS day")

filename="styrelsemote_$(date "+%y%m%d" -d "$TARGET_DATE").md"


sed "s/{DATE}/$(LANG=sv_SE.UTF-8 date -d "$TARGET_DATE" '+%-d %B %Y')/g" \
    > "$filename" \
    < template.md

echo "$filename"

