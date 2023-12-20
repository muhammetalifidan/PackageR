check_result <- check_spotify_credentials()

#Test 1.1
test_that("Global Workspace'de check_spotify_credentials bulunmalı", {
  expect_true(exists("check_spotify_credentials"))
})

#Test 1.2
test_that("check_spotify_credentials adlı değişkenin tipi “function” olmalı.", {
  testthat::expect_true(is.function(check_spotify_credentials))
})

#Test 1.3
test_that("check_spotify_credentials() çağrıldığında döndürdüğü çıktı true olmalı", {
  testthat::expect_true(isTRUE(check_result))
})
