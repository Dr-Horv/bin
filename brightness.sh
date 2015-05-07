dir="/sys/class/backlight/intel_backlight"
MAX=$(cat $dir/max_brightness)
MIN=0
MODIFIER=104
current=$(cat $dir/brightness)

if [[ "$1" == "down" ]]; then
	op=-
else
	op=+
fi

new=$((current $op MODIFIER))
if (($new > $MAX)); then
	new=$MAX
fi

if (($new < $MIN)); then
	new=$MIN
fi
sudo tee $dir/brightness <<< $new
