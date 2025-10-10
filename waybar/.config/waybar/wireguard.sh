#!/usr/bin/env bash

ip -details -json link show type wireguard | jq -r -c --unbuffered '
  [.[] | .ifname | select(. != null)] |
  if length != 0 then
    if length == 1 then
      {text: .[], alt: "up", class: "wireguard"}
    else
      {text: "#" + (length | tostring), alt: "up", class: "wireguard"}
    end
  else
    {text: "", alt: "down", class: "wireguard"}
  end
'
