#!/usr/bin/env bash

# Script pour afficher la main ASCII avec l'index marqué et une aura circulaire

HIDE="\e[?25l"
SHOW="\e[?25h"

DURATION=3       # Durée totale de l'animation en secondes
INTERVAL=0.3     # Intervalle entre les frames

# Main ASCII
HAND_BASE="\
    ____ ____ ____ ____  
   |    |    |    | O  |  
   |____|____|____|____|  
   |    |    |    |    |  
   |    |    |    |    |  
   |    |    |    |    |  
   |    |    |    |    |_______  
   |                           |  
   |                     ______|  
   |                    |  
   |                    |  
   |                    |  
   |____________________|"

# Frames pour l'aura circulaire autour de l'index
AURA_FRAMES=(
"                   *** 
                  * * *
                   ***"
"                    *  
                   *O* 
                    *"
"                   * * 
                  * O *
                   * *"
)

trap "printf '${SHOW}\n'; exit" INT TERM

printf "$HIDE"
END=$((SECONDS+DURATION))

while [ $SECONDS -lt $END ]; do
    for aura in "${AURA_FRAMES[@]}"; do
        clear
        # Affiche l'aura au-dessus et autour du troisième doigt (index)
        echo -e "$aura"
        echo -e "$HAND_BASE"
        sleep $INTERVAL
    done
done

printf "$SHOW"


