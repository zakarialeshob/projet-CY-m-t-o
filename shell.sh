#!/bin/bash

check_nb_args() {
  for ((i=1; i<=$#; i++)); do
	if [[ "${!i}" = "--help" ]]; then		#opens help.txt directly in the terminal
			cat help.txt
	fi
	done
	if [ $# -lt 3 ]; then					#checks if there are the minimum amount of argument for the program to work properly
    exit 0
	fi
}

while getopts "f:" opt; do
  case $opt in
    f) file="$OPTARG"
	if ! echo "$file" | grep -q "\.csv$"; then
         echo "Erreur: le fichier doit être entré au format .csv"
         exit 1
       fi
       ;;
  esac
done

echo "Le fichier est: $file"   		#à enlever

check_nb_args "$@"

 
function arg_t() {
  for ((i=1; i<=$#; i++)); do
    if [[ "${!i}" = "-t1" ]]; then				#moyenne des pressions par stations
		for ((j=1; j<=$#; j++)); do
				if [[ "${!j}" = "-F" ]]; then 				#sorting France
					awk -F, '$16 >=0 && $16 <= 96000 {sum12+=$12; if (NR == 1) { min12=$12; max12=$12;} else {if ($12<min12) {min12=$12}; if ($12>max12) {max12=$12}}} END {print $1 "," $10 "," $11 "," sprintf("%f", $12) "," sprintf("%f", sum12/NR) "," sprintf("%f", min12) "," sprintf("%f", max12)}' $file > temperature.csv
				elif [[ "${!j}" = "-G" ]]; then 			#sorting Guyane
					awk -F, '$16 >=97300 && $16 <= 97390 {sum12+=$12; if (NR == 1) { min12=$12; max12=$12;} else {if ($12<min12) {min12=$12}; if ($12>max12) {max12=$12}}} END {print $1 "," $10 "," $11 "," sprintf("%f", $12) "," sprintf("%f", sum12/NR) "," sprintf("%f", min12) "," sprintf("%f", max12)}' $file > temperature.csv
				elif [[ "${!j}" = "-S" ]]; then 			#sorting Saint-Pierre et Miquelon
					awk -F, '$10 == 46.766333 && $11 == -56.179167 {sum12+=$12; if (NR == 1) { min12=$12; max12=$12;} else {if ($12<min12) {min12=$12}; if ($12>max12) {max12=$12}}} END {print $1 "," $10 "," $11 "," sprintf("%f", $12) "," sprintf("%f", sum12/NR) "," sprintf("%f", min12) "," sprintf("%f", max12)}' $file > temperature.csv
				elif [[ "${!j}" = "-A" ]]; then 			#sorting Antilles
					awk -F, '$16 >=97200 && $16 <= 97290 {sum12+=$12; if (NR == 1) { min12=$12; max12=$12;} else {if ($12<min12) {min12=$12}; if ($12>max12) {max12=$12}}} END {print $1 "," $10 "," $11 "," sprintf("%f", $12) "," sprintf("%f", sum12/NR) "," sprintf("%f", min12) "," sprintf("%f", max12)}' $file > temperature.csv
				elif [[ "${!j}" = "-O" ]]; then 			#sorting Ocean Indien
					awk -F, '$16 >=98411 && $16 <= 98415 {sum12+=$12; if (NR == 1) { min12=$12; max12=$12;} else {if ($12<min12) {min12=$12}; if ($12>max12) {max12=$12}}} END {print $1 "," $10 "," $11 "," sprintf("%f", $12) "," sprintf("%f", sum12/NR) "," sprintf("%f", min12) "," sprintf("%f", max12)}' $file > temperature.csv
				elif [[ "${!j}" = "-Q" ]]; then 			#sorting Antarctic
					awk -F, '$16 >=0 && $16 <= 96000 {sum12+=$12; if (NR == 1) { min12=$12; max12=$12;} else {if ($12<min12) {min12=$12}; if ($12>max12) {max12=$12}}} END {print $1 "," $10 "," $11 "," sprintf("%f", $12) "," sprintf("%f", sum12/NR) "," sprintf("%f", min12) "," sprintf("%f", max12)}' $file > temperature.csv
				else 
					awk -F, '{sum12+=$12; if (NR == 1) { min12=$12; max12=$12;} else {if ($12<min12) {min12=$12}; if ($12>max12) {max12=$12}}} END {print $1 "," $10 "," $11 "," sprintf("%f", $12) "," sprintf("%f", sum12/NR) "," sprintf("%f", min12) "," sprintf("%f", max12)}' $file > temperature.csv
				fi
			done
	elif [[ "${!i}" = "-t2" ]]; then			#pression moyenne par heure dans l'ordre chronologique
		echo "Erreur syntaxe à la position $i. Veuillez réessayer."
	elif [[ "${!i}" = "-t3" ]]; then			#les deux du haut combinés
		echo "Erreur syntaxe à la position $i. Veuillez réessayer."
    elif [[ "${!i}" = "-t" ]]; then
		echo "Erreur, ajoutez les modes 1, 2 ou 3. exemple : -t2."
	fi
  done
}


function arg_p() {
  for ((i=1; i<=$#; i++)); do
    if [[ "${!i}" = "-p1" ]]; then
		for ((j=1; j<=$#; j++)); do
				if [[ "${!j}" = "-F" ]]; then 				#sorting France
					awk -F, '$16 >=0 && $16 <= 96000 {sum7+=$7; if (NR == 1) { min7=$7; max7=$7;} else {if ($7<min7) {min7=$7}; if ($7>max7) {max7=$7}}} END {print $1 "," $10 "," $11 "," sprintf("%f", sum7/NR) "," sprintf("%f", min7) "," sprintf("%f", max7)}' $file > pressure.csv
				elif [[ "${!j}" = "-G" ]]; then 			#sorting Guyane
					awk -F, '$16 >=97300 && $16 <= 97390 {sum7+=$7; if (NR == 1) { min7=$7; max7=$7;} else {if ($7<min7) {min7=$7}; if ($7>max7) {max7=$7}}} END {print $1 "," $10 "," $11 "," sprintf("%f", sum7/NR) "," sprintf("%f", min7) "," sprintf("%f", max7)}' $file > pressure.csv
				elif [[ "${!j}" = "-S" ]]; then 			#sorting Saint-Pierre et Miquelon
					awk -F, '$10 == 46.766333 && $11 == -56.179167 {sum7+=$7; if (NR == 1) { min7=$7; max7=$7;} else {if ($7<min7) {min7=$7}; if ($7>max7) {max7=$7}}} END {print $1 "," $10 "," $11 "," sprintf("%f", sum7/NR) "," sprintf("%f", min7) "," sprintf("%f", max7)}' $file > pressure.csv
				elif [[ "${!j}" = "-A" ]]; then 			#sorting Antilles
					awk -F, '$16 >=97200 && $16 <= 97290 {sum7+=$7; if (NR == 1) { min7=$7; max7=$7;} else {if ($7<min7) {min7=$7}; if ($7>max7) {max7=$7}}} END {print $1 "," $10 "," $11 "," sprintf("%f", sum7/NR) "," sprintf("%f", min7) "," sprintf("%f", max7)}' $file > pressure.csv
				elif [[ "${!j}" = "-O" ]]; then 			#sorting Ocean Indien
					awk -F, '$16 >=98411 && $16 <= 98415 {sum7+=$7; if (NR == 1) { min7=$7; max7=$7;} else {if ($7<min7) {min7=$7}; if ($7>max7) {max7=$7}}} END {print $1 "," $10 "," $11 "," sprintf("%f", sum7/NR) "," sprintf("%f", min7) "," sprintf("%f", max7)}' $file > pressure.csv
				elif [[ "${!j}" = "-Q" ]]; then 			#sorting Antarctic
					awk -F, '$16 >=0 && $16 <= 96000 {sum7+=$7; if (NR == 1) { min7=$7; max7=$7;} else {if ($7<min7) {min7=$7}; if ($7>max7) {max7=$7}}} END {print $1 "," $10 "," $11 "," sprintf("%f", sum7/NR) "," sprintf("%f", min7) "," sprintf("%f", max7)}' $file > pressure.csv
				else 
					awk -F, '{sum7+=$7; if (NR == 1) { min7=$7; max7=$7;} else {if ($7<min7) {min7=$7}; if ($7>max7) {max7=$7}}} END {print $1 "," $10 "," $11 "," sprintf("%f", sum7/NR) "," sprintf("%f", min7) "," sprintf("%f", max7)}' $file > pressure.csv
				fi
			done
	elif [[ "${!i}" = "-p2" ]]; then
		echo "Erreur syntaxe à la position $i. Veuillez réessayer."
	elif [[ "${!i}" = "-p3" ]]; then
		echo "Erreur syntaxe à la position $i. Veuillez réessayer."
    elif [[ "${!i}" = "-p" ]]; then
		echo "Erreur, ajoutez les modes 1, 2 ou 3. exemple : -p2."
	fi
  done
}


function arg_w() {
	for ((i=1; i<=$#; i++)); do
		if [[ "${!i}" = "-w" ]]; then
			for ((j=1; j<=$#; j++)); do
				if [[ "${!j}" = "-F" ]]; then 				#sorting France
					awk -F, '$16 >=0 && $16 <= 96000 {sum4+=$4; sum5+=$5} END {print $1 "," $10 "," $11 "," sprintf("%f", sum4/NR) "," sprintf("%f", sum5/NR)}' $file > wind.csv
				elif [[ "${!j}" = "-G" ]]; then 			#sorting Guyane
					awk -F, '$16 >=97300 && $16 <= 97390 {sum4+=$4; sum5+=$5} END {print $1 "," $10 "," $11 "," sprintf("%f", sum4/NR) "," sprintf("%f", sum5/NR)}' $file > wind.csv
				elif [[ "${!j}" = "-S" ]]; then 			#sorting Saint-Pierre et Miquelon
					awk -F, '$10 == 46.766333 && $11 == -56.179167 {sum4+=$4; sum5+=$5} END {print $1 "," $10 "," $11 "," sprintf("%f", sum4/NR) "," sprintf("%f", sum5/NR)}' $file > wind.csv
				elif [[ "${!j}" = "-A" ]]; then 			#sorting Antilles
					awk -F, '$16 >=97200 && $16 <= 97290 {sum4+=$4; sum5+=$5} END {print $1 "," $10 "," $11 "," sprintf("%f", sum4/NR) "," sprintf("%f", sum5/NR)}' $file > wind.csv
				elif [[ "${!j}" = "-O" ]]; then 			#sorting Ocean Indien
					awk -F, '$16 >=98411 && $16 <= 98415 {sum4+=$4; sum5+=$5} END {print $1 "," $10 "," $11 "," sprintf("%f", sum4/NR) "," sprintf("%f", sum5/NR)}' $file > wind.csv
				elif [[ "${!j}" = "-Q" ]]; then 			#sorting Antarctic
					awk -F, '$16 >=0 && $16 <= 96000 {sum4+=$4; sum5+=$5} END {print $1 "," $10 "," $11 "," sprintf("%f", sum4/NR) "," sprintf("%f", sum5/NR)}' $file > wind.csv
				else 
					awk -F, '{sum4+=$4; sum5+=$5} END {print $1 "," $10 "," $11 "," sprintf("%f", sum4/NR) "," sprintf("%f", sum5/NR)}' $file > wind.csv
				fi
			done
	 
		for ((k=1; k<=$#; k++)); do
			if [[ "${!k}" = "-r" ]]; then
				for ((n=1; n<=$#; n++)); do
					if [[ "${!n}" = "--tab" ]]; then
						make -f makefilew
						./execw wind.csv sorting_wind.csv r tab 				
					elif [[ "${!n}" = "---abr" ]]; then
						make -f makefilew
						./execw wind.csv sorting_wind.csv r abr 
					elif [[ "${!n}" = "---avl" ]]; then
						make -f makefilew
						./execw wind.csv sorting_wind.csv r avl 
					else
						make -f makefilew
						./execw wind.csv sorting_wind.csv r tab 
					fi
				done
			else
				for ((n=1; n<=$#; n++)); do
					if [[ "${!n}" = "--tab" ]]; then
						make -f makefilew
						./execw wind.csv sorting_wind.csv tab 				
					elif [[ "${!n}" = "--abr" ]]; then
						make -f makefilew
						./execw wind.csv sorting_wind.csv abr 
					elif [[ "${!n}" = "--avl" ]]; then
						make -f makefilew
						./execw wind.csv sorting_wind.csv avl 
					else
						make -f makefilew
						./execw wind.csv sorting_wind.csv tab 
					fi
				done
			fi
		done
	 fi
	done
}


function arg_h() {
  for ((i=1; i<=$#; i++)); do
    if [[ "${!i}" = "-h" ]]; then
	for ((j=1; j<=$#; j++)); do
	  if [[ "${!j}" = "-F" ]]; then 				#sorting France		
	    awk -F, '$16 >=0 && $16 <= 96000 {print $1 "," sprintf("%f", $10) "," sprintf("%f", $11) "," sprintf("%f", $15) }' $file > altitude.csv
      elif [[ "${!j}" = "-G" ]]; then 			#sorting Guyane
	    awk -F, '$16 >=97300 && $16 <= 97390 {print $1 "," sprintf("%f", $10) "," sprintf("%f", $11) "," sprintf("%f", $15) }' $file > altitude.csv
	  elif [[ "${!j}" = "-S" ]]; then 			#sorting Saint-Pierre et Miquelon
	    awk -F, '$10 == 46.766333 && $11 == -56.179167 {print $1 "," sprintf("%f", $10) "," sprintf("%f", $11) "," sprintf("%f", $15) }' $file > altitude.csv
	  elif [[ "${!j}" = "-A" ]]; then 			#sorting Antilles
	    awk -F, '$16 >=97200 && $16 <= 97290 {print $1 "," sprintf("%f", $10) "," sprintf("%f", $11) "," sprintf("%f", $15) }' $file > altitude.csv
	  elif [[ "${!j}" = "-O" ]]; then 			#sorting Ocean Indien
	    awk -F, '$16 >=98411 && $16 <= 98415 {print $1 "," sprintf("%f", $10) "," sprintf("%f", $11) "," sprintf("%f", $15) }' $file > altitude.csv
	  elif [[ "${!j}" = "-Q" ]]; then 			#sorting Antarctic
	    awk -F, '$16 >=0 && $16 <= 96000 {print $1 "," sprintf("%f", $10) "," sprintf("%f", $11) "," sprintf("%f", $15) }' $file > altitude.csv
	  else
		awk -F, '{print $1 "," sprintf("%f", $10) "," sprintf("%f", $11) "," sprintf("%f", $15) }' $file > altitude.csv
	  fi
	 done
	 
	 for ((k=1; k<=$#; k++)); do
		if [[ "${!k}" = "-r" ]]; then
			for ((n=1; n<=$#; n++)); do
				if [[ "${!n}" = "--tab" ]]; then
					make -f makefileh
					./exech altitude.csv sorting_altitude.csv  r	tab			
				elif [[ "${!n}" = "--abr" ]]; then
					make -f makefileh
					./exech altitude.csv sorting_altitude.csv  r abr
				elif [[ "${!n}" = "--avl" ]]; then
					make -f makefileh
					./exech altitude.csv sorting_altitude.csv  r avl
				else
					make -f makefileh
					./exech altitude.csv sorting_altitude.csv r tab 
				fi
			done
		else
				for ((n=1; n<=$#; n++)); do
				if [[ "${!n}" = "--tab" ]]; then
					make -f makefileh
					./exech altitude.csv sorting_altitude.csv tab 				
				elif [[ "${!n}" = "--abr" ]]; then
					make -f makefileh
					./exech altitude.csv sorting_altitude.csv abr 
				elif [[ "${!n}" = "--avl" ]]; then
					make -f makefileh
					./exech altitude.csv sorting_altitude.csv avl 
				else
					make -f makefileh
					./exech altitude.csv sorting_altitude.csv tab 
				fi
			done
		fi
	 done
	 
    fi
  done
}


function arg_m() {
  for ((i=1; i<=$#; i++)); do
    if [[ "${!i}" = "-m" ]]; then
	for ((j=1; j<=$#; j++)); do
	  if [[ "${!j}" = "-F" ]]; then 				#sorting France	
		awk -F, '$16 >=0 && $16 <= 96000 {print $1 "," sprintf("%f", $10) "," sprintf("%f", $11) "," sprintf("%f", $6) }' $file > moisture.csv
      elif [[ "${!j}" = "-G" ]]; then 			#sorting Guyane
		awk -F, '$16 >=97300 && $16 <= 97390 {print $1 "," sprintf("%f", $10) "," sprintf("%f", $11) "," sprintf("%f", $6) }' $file > moisture.csv
	  elif [[ "${!j}" = "-S" ]]; then 			#sorting Saint-Pierre et Miquelon
		awk -F, '$10 == 46.766333 && $11 == -56.179167 {print $1 "," sprintf("%f", $10) "," sprintf("%f", $11) "," sprintf("%f", $6) }' $file > moisture.csv
	  elif [[ "${!j}" = "-A" ]]; then 			#sorting Antilles
	    awk -F, '$16 >=97200 && $16 <= 97290 {print $1 "," sprintf("%f", $10) "," sprintf("%f", $11) "," sprintf("%f", $6) }' $file > moisture.csv
	  elif [[ "${!j}" = "-O" ]]; then 			#sorting Ocean Indien
	    awk -F, '$16 >=98411 && $16 <= 98415 {print $1 "," sprintf("%f", $10) "," sprintf("%f", $11) "," sprintf("%f", $6) }' $file > moisture.csv
	  elif [[ "${!j}" = "-Q" ]]; then 			#sorting Antarctic
	    awk -F, '$16 >=0 && $16 <= 96000 {print $1 "," sprintf("%f", $10) "," sprintf("%f", $11) "," sprintf("%f", $6) }' $file > moisture.csv
	  else
		awk -F, '{print $1 "," sprintf("%f", $10) "," sprintf("%f", $11) "," sprintf("%f", $6) }' $file > moisture.csv
	  fi
	 done
	 for ((k=1; k<=$#; k++)); do
	if [[ "${!k}" = "-r" ]]; then
		for ((n=1; n<=$#; n++)); do
				if [[ "${!n}" = "--tab" ]]; then
					make -f makefilem
					./execm moisture.csv sorting_moisture.csv r tab 		
				elif [[ "${!n}" = "--abr" ]]; then
					make -f makefilem
					./execm moisture.csv sorting_moisture.csv r abr 
				elif [[ "${!n}" = "--avl" ]]; then
					make -f makefilem
					./execm moisture.csv sorting_moisture.csv r avl 
				else
					make -f makefilem
					./execm moisture.csv sorting_moisture.csv r tab 
				fi
			done
	else
		for ((n=1; n<=$#; n++)); do
				if [[ "${!n}" = "--tab" ]]; then
					make -f makefilem
					./execm moisture.csv sorting_moisture.csv tab 				
				elif [[ "${!n}" = "--abr" ]]; then
					make -f makefilem
					./execm moisture.csv sorting_moisture.csv abr 
				elif [[ "${!n}" = "--avl" ]]; then
					make -f makefilem
					./execm moisture.csv sorting_moisture.csv avl 
				else
					make -f makefilem
					./execm moisture.csv sorting_moisture.csv tab 
				fi
		done
	fi
	done

    fi
  done
}

arg_t "$@"
arg_p "$@"
arg_w "$@"
arg_h "$@"
arg_m "$@"

