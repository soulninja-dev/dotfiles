#!/usr/bin/env bash

## Change Openbox Styles

# Dir
dir="$HOME/.config/openbox/styles"

# Lib
if ! . "/usr/lib/archcraft/common/ac-include.cfg" 2>/dev/null; then
    echo $"Error: Failed to source /usr/lib/archcraft/common/ac-include.cfg" >&2 ; exit 1
fi

# Styles
styles=(`ls -p --hide={Default.sh,Beach-Bitmap.sh,Forest-Bitmap.sh} $dir`)
bitmap=(`cd $dir && ls *-Bitmap.sh`)

gen_menu () {
    local count=1
    local bcount=1

	menuStart
	menuItem "Default" "bash $dir/Default.sh"
	menuSeparator "| Simple |"
	for style in "${styles[@]}"; do
		menuItem "${count}. ${style%.*}" "bash $dir/$style"
		count=$(($count+1))
	done
	menuSeparator "| Bitmap |"
	for bmap in "${bitmap[@]}"; do
		menuItem "${bcount}. ${bmap%-*} (Bitmap)" "bash $dir/$bmap"
		bcount=$(($bcount+1))
	done
	menuEnd
}

{ gen_menu; exit 0; }
