#! /usr/bin/env bash

# default prefix
prefix="$HOME/.local/bin"
if [[ "$1" != "" ]]; then
    prefix="$1"
fi
PWD=$(pwd)

echo "install to $prefix"

[[ -d "$prefix" ]] || mkdir -p "$prefix"

install() {
    local src="$PWD/$1"
    echo "install $src to $prefix"
    ln -s -f "$src" "$prefix"
}

install agg
install agv
install rgg
install vv
