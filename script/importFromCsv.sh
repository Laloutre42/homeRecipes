#!/usr/bin/env bash

# Export table recip to csv
mysql -uroot -proot -e "SELECT id,name, ingredients FROM homerecipes.recipe;" -B > csv/recipe.csv

# Export table wine to csv
mysql -uroot -proot -e "SELECT * FROM homerecipes.wine;" -B > csv/wine.csv

echo "Done"


#LOAD DATA INFILE "csv/test.csv" INTO TABLE homerecipes.recipe COLUMNS TERMINATED BY '\t' OPTIONALLY ENCLOSED BY '"' ESCAPED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES;