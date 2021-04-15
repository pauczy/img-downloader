#!/bin/bash

#Paulina Czyż, projekt1 Sieci Komputerowe
#skrypt bash pobierający wszystkie obrazki ze strony www podanej jako argument (wymaga zainstalowanego wget)

if [ $# -ne 1 ]
then
	echo "skrypt pobiera wszystkie obrazki ze strony www podanej jako argument"
	echo "składnia: $0 adres_strony"
	exit 1
else
	wget -k -qO tmp_file.txt $1 # -O do podanego pliku, -q bez komunikatów, -k ścieżki absolutne
	if [ $? -ne 0 ] # jeśli nie udało się pobrać strony 
	then
		echo "podano błędny adres strony"
		rm tmp_file.txt 
		exit 1
	else
		directory="imgs_$(date "+%Y-%m-%d-%H-%M-%S")"
		images=$(grep -Eo '<img[^>]*src="[^"]*"' tmp_file.txt | grep -Eo '[^"]+\.(png|jpg|gif|jpeg)' | sort -u) #grep -E regex, -o pokazje tylko match 
		for img in $images
		do
			echo "downloading image..."
			wget $img -q -P $directory/ #-q bez komunikatów, -P directory prefix
			if [ $? -eq 0 ]
			then
				echo "succes! image downloaded"
			fi
		done
		rm tmp_file.txt
	fi
fi

