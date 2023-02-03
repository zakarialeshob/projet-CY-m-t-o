#!/usr/local/bin/gnuplot -persist
# set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 600, 400 
# set output 'errorbars.png'
unset errorbars
set grid nopolar
set grid xtics mxtics ytics mytics noztics nomztics nortics nomrtics \
 nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set grid layerdefault   lt 0 linecolor 0 linewidth 0.500,  lt 0 linecolor 0 linewidth 0.500
set style data lines
set ytics  norangelimit logscale autofreq 
set title "Error on y represented by filledcurve shaded region" 
set xlabel "Time (sec)" 
set xrange [ * : * ] noreverse writeback
set x2range [ * : * ] noreverse writeback
set ylabel "Rate" 
set yrange [ * : * ] noreverse writeback
set y2range [ * : * ] noreverse writeback
set zrange [ * : * ] noreverse writeback
set cbrange [ * : * ] noreverse writeback
set rrange [ * : * ] noreverse writeback
set logscale y 10
set colorbox vertical origin screen 0.9, 0.2 size screen 0.05, 0.6 front  noinvert bdefault
n(x)=1.53**2*x/(5.67+x)**2
NO_ANIMATION = 1
Shadecolor = "#80E0A080"
## Last datafile plotted: "sorties.csv"
plot 'sorties.csv' using 1:($2+$3):($2-$3)       with filledcurve fc rgb Shadecolor title "Shaded error region",     '' using 1:2 smooth mcspline lw 2   title "Monotonic spline through data"
