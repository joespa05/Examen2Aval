#!/bin/bash

calcular_consumo() {
    ciudad="$1"
    total=0

    while read -r linea; do
        ciudad_linea=$(echo "$linea" | awk '{print $1}')
        if [ "$ciudad" = "$ciudad_linea" ]; then
            consumo=$(echo "$linea" | awk '{print $4}')
            total=$((total + consumo))
        fi
    done < consumos.txt

    echo "El total de consumo en $ciudad es: $total"
}

echo "Introduce el nombre de la ciudad:"
read ciudad
while ! grep -q "$ciudad" consumos.txt; do
    echo "La ciudad no existe. Inténtalo de nuevo."
    read ciudad
done

calcular_consumo "$ciudad"

