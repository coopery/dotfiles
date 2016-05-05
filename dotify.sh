# This script configures the home directory to use shared config files
# It creates symbolic links to all the files in this repo

ignore_home=('.' '..' '.git' '.config')

# Remove non-shared config files
# Create symbolic links to shared config files
for filename in .*; do
    # Ignore names in ignore_home
    if [[ ! " ${ignore_home[@]} " =~ " $filename " ]]; then
        echo Removing: "~"/$filename
        rm -rf ~/$filename
        echo Creating: "~"/$filename "-> ~/"${PWD##*/}/$filename
        ln -s $PWD/$filename ~/$filename
    else
        echo Ignoring: $filename;
    fi
done;

ignore_config=('.' '..')

for filename in .config/*; do
    # Ignore names in ignore_config
    if [[ ! " ${ignore_config[@]} " =~ " $filename " ]]; then
        echo Removing: "~"/$filename
        rm -rf ~/.config/$filename
        echo Creating: "~"/$filename "-> ~/.config/"${PWD##*/}/$filename
        ln -s $PWD/$filename ~/$filename
    else
        echo Ignoring: .config/$filename;
    fi
done;
