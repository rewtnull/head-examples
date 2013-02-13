#!/bin/bash
#
# Head example 2 - 20130211
#
# Copyright (C) 2013 Marcus Hoffren <marcus.hoffren@gmail.com>.
# License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
# This is free software: you are free to change and redistribute it.
# There is NO WARRANTY, to the extent permitted by law.
#

# Do we run this on Bash v4.1+?
[[ "${BASH_VERSION}" < 4.1 ]] && { echo -e "${0} requires \033[1mbash v4.1 or newer\033[m."; exit 1; }

# Accept $1, $2. Return N bytes
headb() {
    local IFS="|"
    [[ ! -a "${1}" ]] && { echo "'${1}' File does not exist."; exit 1; }
    if [[ "${2}" =~ ^[[:digit:]]+$ ]]; then
	read -N "${2}" line < "${1}"
	echo "${line}"
	exit 0
    else
	echo "'${2}' Invalid argument. Expecting a numeric value."
	exit 1
    fi
}
headb "${1}" "${2}"
