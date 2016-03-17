# This script configures the home directory to use shared config files
# It creates symbolic links to all the files in this repo

Ignore=('.' '..' '.git')

# Remove non-shared config files
# Create symbolic links to shared config files
for filename in .*; do
    # Ignore names in Ignore
    if [[ ! " ${Ignore[@]} " =~ " $filename " ]]; then
        echo Removing: "~"/$filename
        rm -rf ~/$filename
        echo Creating: "~"/$filename "-> ~/"${PWD##*/}/$filename
        ln -s $PWD/$filename ~/$filename
    else
        echo Ignoring: $filename;
    fi
done;
