context("ods_error_message")

test_that("non-existent dataset produces correct message", {
  skip_on_cran()
  expect_that(ods_dataset("average-household-siz")
    , throws_error("The dataset 'average-household-siz' does not exist.\nA full list of available datsets can be found by running 'ods_all_datasets()'."
      , fixed = TRUE))
})

test_that("non-existent dataset produces correct message with filter", {
  skip_on_cran()
  expect_that(ods_dataset("average-household-siz", start_date = 2017)
    , throws_error("The dataset 'average-household-siz' does not exist.\nA full list of available datsets can be found by running 'ods_all_datasets()'."
      , fixed = TRUE))
})

test_that("response too large produces correct message", {
  skip_on_cran()
  expect_that(ods_dataset("working-age-claimants-of-benefits-key")
    , throws_error("The dataset 'working-age-claimants-of-benefits-key' is too large to be downloaded directly.\nTry adding filters to reduce size or contact statistics.enquiries@gov.scot if you require the full dataset."
      , fixed = TRUE))
})

test_that("response too large produces correct message with filter", {
  skip_on_cran()
  expect_that(ods_dataset("working-age-claimants-of-benefits-key")
    , throws_error("The dataset 'working-age-claimants-of-benefits-key' is too large to be downloaded directly.\nTry adding filters to reduce size or contact statistics.enquiries@gov.scot if you require the full dataset."
      , fixed = TRUE))
})

test_that("syntax error produces correct message", {
  skip_on_cran()
  expect_that(ods_dataset("average household size")
    , throws_error("The query generated from the dataset 'average household size' produced a syntax error, possibly a result of spaces in the dataset name.\nA full list of available datsets can be found by running 'ods_all_datasets()'."
      , fixed = TRUE))
})

test_that("syntax error produces correct message", {
  skip_on_cran()
  expect_that(ods_dataset("average household size")
    , throws_error("The query generated from the dataset 'average household size' produced a syntax error, possibly a result of spaces in the dataset name.\nA full list of available datsets can be found by running 'ods_all_datasets()'."
      , fixed = TRUE))
})
