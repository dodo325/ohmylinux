#! /bin/bash

reverse() {
    declare -n arr="$1" rev="$2"
    for i in "${arr[@]}"; do
        rev=("$i" "${rev[@]}")
    done
}