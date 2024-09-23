#!/bin/bash
#set -x

BASE=$(dirname $(realpath $0))
OUT=${BASE}/compile_commands.json
DB=$(make -Bn)

COMPILE_COMMANDS=$(echo "${DB}" | grep -oP 'riscv-none-embed-gcc\s+.*\-c\s+.*')
(
echo "["
while read line
do
    F=$(realpath "$(echo "$line" | grep -oP '\b\S+?\.(c|cpp|s|S)\b')")
    DIR=$(dirname ${F})
    FILE=$(basename ${F})
    #cat  >> ${OUT} <<"EOF"
    cat  <<EOF
{ "directory": "${DIR}", "file": "${FILE}", "command": "${line}" }
EOF
done <<< "${COMPILE_COMMANDS}" | sed '$!s/$/,/'
echo "]"
) | jq > ${OUT}