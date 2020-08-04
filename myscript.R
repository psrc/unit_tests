# Script for summing numeric columns in a data.table
# This is a toy example serving the purpose of 
# demontrating how unit tests work.
# 08/04/2020
# Hana Sevcikova

library(data.table)

# Main function - select numeric columns and sum them
sum.rows <- function(dt) {
    return(dt[, lapply(.SD, sum), .SDcols = which(sapply(dt, is.numeric))])
}

# Create dataset
d <- data.table(A = 1:3, B = rep(3, 3))
cat("\nOriginal data:\n")
print(d)

# Process
sumd <- sum.rows(d)
cat("\nResults:\n")
print(sumd)

# Write outputs
fwrite(sumd, "myscript_data.csv")

