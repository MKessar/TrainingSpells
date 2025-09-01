#!/bin/bash

MSG="There is no spoon"

clear
tput civis  # cacher le curseur

# dimensions du terminal
LINES=$(tput lines)
COLS=$(tput cols)

# position du texte
row=$((LINES/2))
col=$(( (COLS-${#MSG})/2 ))

start=$(date +%s)

while true; do
    now=$(date +%s)
    elapsed=$((now - start))
    if [ $elapsed -ge 4 ]; then
        break
    fi

    clear

    # afficher le message centré
    tput cup $row $col
    echo -e "\033[1;97m$MSG\033[0m"

    # dessiner quelques étincelles aléatoires autour
    for i in {1..20}; do
        y=$((row-3+RANDOM%7))
        x=$((col-5+RANDOM%(${#MSG}+10)))
        sym=("." "*" "o" "O" "+")
        c=${sym[$RANDOM%${#sym[@]}]}
        color=$((31+RANDOM%7))
        tput cup $y $x
        echo -ne "\033[1;${color}m$c\033[0m"
    done

    sleep 0.1
done

# restauration du curseur
tput cnorm

# replacer le message final sans effacer l'écran
tput cup $row $col
echo -e "\033[1;97m$MSG\033[0m"

# ajouter 5 lignes vides puis retour à la ligne
for i in {1..7}; do
    echo ""
done

