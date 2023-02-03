#!/usr/bin/gnuplot -persist  
set title "Temperature" 
set ylabel "Moyenne Temperature" 
set xlabel "identifiant de la station" 
plot 't1.csv' using 1:2:3 with title "Minimum et maximum", '' using 1:3 with lines title "Moyenne"
