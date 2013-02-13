#!/bin/bash
#
# Head example 3 - 20120211
#
# Copyright (C) 2013 Marcus Hoffren <marcus.hoffren@gmail.com>.
# License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
# This is free software: you are free to change and redistribute it.
# There is NO WARRANTY, to the extent permitted by law.
#

# Do we run this on Bash v4.1+?
[[ "${BASH_VERSION}" < 4.1 ]] && { echo -e "${0} requires \033[1mbash v4.1 or newer\033[m."; exit 1; }

# Accept $1, optionally $2 and/or $3. Return N lines or bytes
headc() {
    local IFS="|"
    [[ ! -a "${1}" ]] && { echo "'${1}' File does not exist."; exit 1; }
    local numlines="${2}" # Value can't be assigned to special var
    case "${2}" in
	-c|--bytes) # Output N bytes instead of lines
	    if [[ "${3}" =~ ^[[:digit:]]+$ ]]; then
		read -N "${3}" line < "${1}"
		echo "${line}"
		exit 0
	    else
		echo "'${3}' Invalid argument. Expecting a numeric value."
		exit 1
	    fi;;
	"")
	    local numlines="10";; # Default no. of output lines
    esac
    if [[ "${numlines}" =~ ^[[:digit:]]+$ ]]; then # Output N lines
	for (( i = 0; "${i}" < "${numlines}"; i++ )); do
	    read -r line
	    if (( "${?}" == "0" )); then # Return value always true as long as there's something to read
		echo "${line}"
	    fi
	done < "${1}"
	exit 0
    else
	echo "'${numlines}' Invalid argument."
	exit 1
    fi
}
headc "${1}" "${2}" "${3}"
