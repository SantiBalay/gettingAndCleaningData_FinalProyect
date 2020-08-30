# Getting and cleaning data - Final Proyect 

## This is the final proyect for the Getting and cleaning data course from John Hopkins University.

## run_analysis.r
1. Loads the X, y and subject textfiles into dataframes, both the train and test ones.
2. Merges all the dataframes into one, row-wise between the pairs, and column-wise between the 3 groups.  
3. Extracts the mean ('mean') values and standart deviation ('std') into a new tidy dataset.
4. Replaces the names into more legible and representative ones.
5. Groups the tidy dataset in activity and subjects and extract their means.
6. Writes both the tidy and grouped datasets into txt files.


