#!/bin/bash
#
# Head example 1 - 20120211
#
# Copyright (C) 2013 Marcus Hoffren <marcus.hoffren@gmail.com>.
# License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
# This is free software: you are free to change and redistribute it.
# There is NO WARRANTY, to the extent permitted by law.
#

# Do we run this on Bash v4.1+?
[[ "${BASH_VERSION}" < 4.1 ]] && { echo -e "${0} requires \033[1mbash v4.1 or newer\033[m."; exit 1; }

# Accept $1, $2. Return N lines
heada() {
    [[ ! -a "${1}" ]] && { echo "'${1}' File does not exist."; exit 1; }
    if [[ ! "${2}" =~ ^[[:digit:]]+$ ]]; then
	echo "'${2}' Invalid argument. Expecting a numeric value."
	exit 1
    fi
    local IFS="|"
    local i="0"
        while read line; do
	    if (( "${i}" < "${2}" )); then
		echo "${line}"
	    fi
	(( i++ ))
	done < "${1}"
	exit 0
}
heada "${1}" "${2}"
