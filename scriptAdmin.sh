#!/bin/sh
wc -l $(file /usr/bin/* | grep "script" | grep -v perl | cut -d: -f1) | sort -n | head -15
