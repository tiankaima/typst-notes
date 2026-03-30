#!/usr/bin/env bash

set -euo pipefail

mkdir -p fonts

if [ ! -d "build" ]; then
    mkdir -p build
else
    rm -rf build/*
fi

for folder in $(ls -d */); do
    folder=${folder%?}
    if [ "$folder" == "fonts" ]; then
        continue
    fi
    if [ "$folder" == "build" ]; then
        continue
    fi
    # if folder contains Makefile, run make
    if [ -f "$folder/Makefile" ]; then
        echo "Running make in $folder"
        make -C $folder
    else
        # Some top-level directories may not contain `main.typ`.
        # Skip them to keep compilation robust (and avoid breaking CI).
        if [ -f "$folder/main.typ" ]; then
            echo "Compiling $folder"
            typst compile --font-path fonts/ --root . ./$folder/main.typ build/${folder}.pdf
        elif [ -f "$folder/main.pdf" ]; then
            # Some projects only keep the compiled PDF.
            echo "Copying pre-built pdf for $folder"
            cp "$folder/main.pdf" "build/${folder}.pdf"
        fi
    fi
done
