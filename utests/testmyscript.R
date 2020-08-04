# Unit tests for myscript.R
# It should be located into one directory below myscript.R,
# or change the relative path in the "source" call.
# 08/04/2020
# Hana Sevcikova

library(testthat)

# Run myscript
source("../myscript.R", chdir = FALSE)

# Check results
################
# Check function
test_that("sum", {
    d <- data.table(C = rep(10, 100), 
                    D = sample(letters, 100, replace = TRUE) # character column
                    )
    res <- sum.rows(d)
    expect_equal(res$C, 100*10) # check values
    expect_equal(ncol(res), 1)  # res contains only one column since D should be ignored 
})

# Check sumd object
test_that("sum_object", {
    expect_true(all(unlist(sumd[, .(A, B)]) == c(6, 9)))
})

# Check written file
test_that("file", {
    d <- fread("myscript_data.csv")
    expect_equal(nrow(d), 1) # check that it has one row only
    expect_true(all(unlist(d[, .(A, B)]) == c(6, 9))) # check values and column names
})

