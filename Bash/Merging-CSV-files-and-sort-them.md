```
cat datafile1.csv datafile2.csv ... datafileN.csv \ # Concatenate datafiles
    | sort -n \ # Sort it according to the string numerical value
    -t ',' \ # The CSV file has ',' as the field separator
    -k1  \ # Sort it w.r.t. the first (=1) field 
    > dataout.csv # Write the sorted data to dataout.csv
```
