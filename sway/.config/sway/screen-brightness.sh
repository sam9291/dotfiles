#!/bin/sh

cd /sys/class/backlight/intel_backlight
read max < max_brightness
read cur < brightness
echo "[$max]sa [0]sb $cur $((max/20)) $1 d 0 >b d $max <a p" \
	| dc >> brightness 2>/dev/null
