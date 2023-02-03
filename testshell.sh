#!/bin/bash

awk -F, '{print $1 "," $10 "," $11 }' meteo_filtered_data_v1.csv > temperature.csv

