#!/usr/bin/bash

# Source: https://github.com/nwg-piotr/autotiling

handle() {
  local event=$(swaymsg -t SUBSCRIBE "['window']");
  local con_par=$(swaymsg -t get_tree | jq -r '[null,.]|recurse(.[1] as $parent|try (.[1].nodes[]|[($parent|del(.nodes)),.]) catch empty) | select(.[1].focused)')
  local con=$(jq .[1] <<< $con_par)
  local parent=$(jq .[0] <<< $con_par)
  [[ $(jq any <<< $con) == false ]] && return;
  [[ $(jq .fullscreen_mode <<< $con) != 0 ]] && return;
  [[ $(jq .fullscreen_mode <<< $parent) != 0 ]] && return;
  [[ $(jq .layout <<< $parent) == '"tabbed"' ]] && return;
  local height=$(jq .rect.height <<< $con)
  local width=$(jq .rect.width <<< $con)
  local layout=$( [[ $height -gt $width ]] && echo "splitv" || echo "splith")
  swaymsg $layout
  echo $width $height $layout
}

while handle; do
  sleep 0.1
done
