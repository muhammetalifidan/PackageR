#' Yetkileri kontrol eder
#'
#' @return SPOTIFY_ID ve SPOTIFY_SECRET'ı kontrol ederek true değeri ya da hata mesajı döndürür
#' @export
check_spotify_credentials <- function() {
  api_id <- Sys.getenv("SPOTIFY_ID")

  if(api_id == "") {
    stop("Spotify API ID boş. Lütfen .Renviron dosyasını doğru şekilde düzenleyiniz.")
  }

  api_secret <- Sys.getenv("SPOTIFY_SECRET")

  if(api_secret == "") {
    stop("Spotify API Secret boş. Lütfen .Renviron dosyasını doğru şekilde düzenleyiniz.")
  }

  return(TRUE)
}
