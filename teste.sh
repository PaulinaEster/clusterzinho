#!/bin/bash
HOST="lesbos"
HOSTNAME="$(hostname)"
if [[ "$HOSTNAME" == "lesbos" ]]; then 
    echo "teste1" 
else 
    echo "teste2" 
fi