
context("Expectations")

test_that("Mismatches fail", {
  failed_result <- subset_results(test_results, "test-failed.R")[[1]]
  expect_match(failed_result$message, "Figures don't match: myplot.svg\n")

  class <- class(failed_result)[[1]]
  expect_equal(class, "expectation_failure")
})

test_that("Doppelgangers pass", {
  passed_result <- subset_results(test_results, "test-passed.R")[[1]]
  expect_is(passed_result, "expectation_success")
})