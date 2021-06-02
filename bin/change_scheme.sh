#!/usr/bin/env bash

## Openbox menu to change alacritty terminal color scheme

# Dir
dir="$HOME/.config/alacritty"

# Lib
if ! . "/usr/lib/archcraft/common/ac-include.cfg" 2>/dev/null; then
    echo $"Error: Failed to source /usr/lib/archcraft/common/ac-include.cfg" >&2 ; exit 1
fi

# Schemes
schemes=($(ls -p $dir/colorschemes))

# Main
main () {
	local count=1

	menuStart
	for scheme in "${schemes[@]}"; do
		menuItem "${count}. ${scheme%.*}" "$0 ${scheme}"
		count=$(($count+1))
	done
	menuEnd

	for scheme in "${schemes[@]}"; do
		if [[ "$1" == "$scheme" ]]; then
			cat "$dir"/colorschemes/"$1" > "$dir"/colors.yml
		fi
	done
}

main "$1"
