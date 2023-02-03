set datafile separator ','
plot 'testdata.csv' u 1:2 w lp lw 1.5 lc 7 title 'carré des nombres'
set title 'nombre et leur carré'
set xlabel 'nombres'
set ylabel 'carrés'
set xrange [0:10]
set yrange [0:100]
set grid

set term png size 1200, 720
set output 'test.png'
replot
