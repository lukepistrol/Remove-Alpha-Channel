#!/bin/bash
version="1.1"

# Help
Help()
{
   # Display Help
   echo "Removes the Alpha channel from any PNG in given directory."
   echo
   echo "Syntax: ./remove-alpha-channel [path-todirectory] [-h|v]"
   echo "options:"
   echo " -h     Print this Help."
   echo " -v     Print software version and exit."
   echo " -c     Print changelog."
   echo
}

# Version
Version() 
{
  echo "Version:   $version"
}

# Changelog
Changelog()
{
  echo "Changelog:"
  echo "v1.1 show status when converting, display success message."
  echo "v1.0 initial version"
  echo
}

# Get the options
while getopts ":h :v :c" option; do
   case $option in
      h)  # display Help
          Help
          exit;;
      v)  # display Version
          Version
          exit;;
      c)  # display Changelog
          Changelog
          exit;;
      \?) # incorrect option
          echo "Error: Invalid option."
          echo "use -h for help"
          exit;;
   esac
done

path=$1;
if test -z "$path"
then
    echo "No path provided."
    echo "use -h for help"
    exit;
else
    cd $path
    count=0
    for i in `ls *.png`; 
    do 
        echo "converting... $i"
        convert $i -background black -alpha remove -alpha off $i; 
        ((count=count+1))
    done
    echo "Successfully converted $count items."
fi