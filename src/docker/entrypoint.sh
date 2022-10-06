#!/bin/bash
if [ -z $(echo $1 | tr '/' ' ' | awk '{print $2}') ]; then
echo "No input was given, these commands are available:"
echo
    ls $(echo $1 | tr '/' ' ' | awk '{print $1}')
else
php $1
fi