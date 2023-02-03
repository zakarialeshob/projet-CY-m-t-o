#!/usr/bin/gnuplot -persist  
set title "Temperature" 
set ylabel "Median Temperature" 
set xlabel "station id" 
plot 't1.csv' using 1:2:3 with title "Min and max", '' using 1:3 with lines title "Moyenne"
