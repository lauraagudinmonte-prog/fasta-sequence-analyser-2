#!/bin/bash
# Este es el script del enunciado numero 7 de la actividad 2
# Directorio donde estan los archivos FASTA
fasta_dir="../data/processed"

for i in $(seq 1 5)
do
    file="$fasta_dir/secuencia${i}.fasta"
    fname=$(basename "$file")

    echo ""
    echo "Archivo $fname"

    # Obtener el nombre de la secuencia
    seq_name=$(sed -n '1s/^>//p' "$file")
    echo "Nombre: $seq_name"

    # Obtener la secuencia de nucleotidos en una sola linea
    seq=$(sed '1d' "$file" | tr -d '\n')

    # Calcular la longitud
    length=${#seq}
    echo "Longitud: $length"

    # Identificar el primer y el ultimo nucleotido
    nt_1=${seq:0:1}
    nt_last=${seq: -1}
    echo "Nucleotido inicial: $nt_1"
    echo "Nucleotido final: $nt_last"

    # Contar G y C
    g=$(echo "$seq" | grep -o "G" | wc -l | tr -d ' ')
    c=$(echo "$seq" | grep -o "C" | wc -l | tr -d ' ')

    if [ "$length" -gt 0 ]
    then
        gc=$(echo "scale=2; ($g+$c)*100.00/$length" | bc)
    else
        gc="0.00"
    fi
    echo "Contenido GC (%): $gc"

    # Buscar los patrones GGGG y TTCC
    gggg=$(echo "$seq" | grep -o "GGGG" | wc -l | tr -d ' ')
    ttcc=$(echo "$seq" | grep -o "TTCC" | wc -l | tr -d ' ')

    if [ "$gggg" -gt 0 ] || [ "$ttcc" -gt 0 ]
    then
        echo "Patrones detectados:"

        if [ "$gggg" -gt 0 ]
        then
            echo " - GGGG aparece $gggg veces."
            echo "Secuencia con GGGG mutacion:"
            echo "$seq" | sed 's/GGGG/Mutation/g'
        else
            echo "GGGG no detectado"
        fi

        if [ "$ttcc" -gt 0 ]
        then
            echo "TTCC aparece $ttcc veces."
        else
            echo "TTCC no detectado"
        fi
    else
        echo "No se han detectado los patrones \"GGGG\" y \"TTCC\""
    fi
done
