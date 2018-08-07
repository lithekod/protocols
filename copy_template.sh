#!/bin/bash

cat template.md \
    | sed "s/{DATE}/$(LANG=sv_SE.UTF-8 date '+%-d %B %Y')/g" \
    > "styrelsemote_$(date "+%y%m%d").md"

