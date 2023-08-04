#!/bin/sh

DIR=~/.local/share/wallpapers
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

swww query || swww init

# pick random pics and set as current wallpaper
cp ${DIR}/${RANDOMPICS} ${DIR}/.wall.set

# set wallpaper using swww
swww img ${DIR}/.wall.set --transition-fps 30 --transition-type any --transition-duration 3
