#----------------------------SPOTIFY_TOKEN TESTLERİ----------------------------

token_result <- spotify_token()

#Test 1.1
test_that("Global Workspace’de spotify_token adlı bir değişken olmalı.",{
  testthat::expect_true(exists("spotify_token"))
})

#Test 1.2
test_that("spotify_token adlı değişkenin tipi “function” olmalı.", {
  testthat::expect_true(is.function(spotify_token))
})

#Test 1.3
test_that("spotify_token() çağrıldığında döndürdüğü çıktı bir liste olmalı", {
  testthat::expect_true(is.list(token_result))
})

#Test 1.4
test_that("spotify_token() çağrıldığında döndürdüğü listenin iki elementi olmalı", {
  expect_length(token_result, 2)
})

#Test 1.5
test_that("spotify_token() çağrıldığında döndürdüğü listenin ilk elementinin ismi status_code olmalı", {
  expect_identical(names(token_result)[1], "status_code")
})




#------------------------SPOTIFY_SEARCH_ARTISTS TESTLERİ------------------------

spotify_search_artist_result <- spotify_search_artist("The Doors")

#Test 1.1
test_that("Global Workspace’de spotify_search_artist adlı bir değişken olmalı.",{
  expect_true(exists("spotify_search_artist"))
})

#Test 1.2
test_that("spotify_search_artist adlı değişkenin tipi “function” olmalı.",{
  expect_true(is.function(spotify_search_artist))
})

#Test 1.3
test_that("spotify_search_artist() herhangi bir artist ismi ile çağrıldığında döndürdüğü çıktı bir liste olmalı.",{
  expect_true(is.list(spotify_search_artist_result))
})
