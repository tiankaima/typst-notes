if [ ! -d "fonts" ]; then
    echo "Please create a folder named 'fonts' and put your fonts in it."
    exit 1
fi

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
        echo "Compiling $folder"
        typst compile --font-path fonts/ ./$folder/main.typ build/${folder}.pdf
    fi
done