#!/usr/bin/env bash
app_name=art_of_wifi
settings="config/api_calls.txt"
dir=".build/$app_name/calls"
api_tpl="src/template/api_call.tpl"
config_template="src/template/api_config.tpl"

load_api_into_dir(){
  origin="$(pwd)"
  cd "$1"
  docker run --rm -it -v "$1:/app" composer/composer require art-of-wifi/unifi-api-client
  cd "$origin"
}

mkdir -p $(pwd)/$dir
load_api_into_dir $(pwd)/$dir
cp $config_template $(pwd)/$dir/config.php

while read line;
do
  alias="$(echo $line | sed -e 's/()//')"
  settings="$(echo $line | sed -e 's/()/.php/')"
  file=$dir/$settings
  touch $file
  cat $api_tpl | sed -e "s/<call>/$line/" > $file
done < $settings
