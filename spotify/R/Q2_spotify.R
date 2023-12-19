#' Token Döndürür
#'
#' @return Spotify ID ve SECRET bilgilerini doğrulayarak token döndürür
#' @export
#' @import httr
spotify_token <- function() {
  body <- list(
    grant_type = "client_credentials",
    client_id = (Sys.getenv("SPOTIFY_ID")),
    client_secret = (Sys.getenv("SPOTIFY_SECRET"))
  )

  endpoint_uri <- "https://accounts.spotify.com/api/token"

  check_spotify_credentials()

  response <- POST(
    url = endpoint_uri,
    body = body,
    encode = "form",
    add_headers("Content-Type" = "application/x-www-form-urlencoded")
  )

  status_code <- status_code(response)
  token <- content(response)$access_token
  bearer_token <- paste("Bearer",token)

  result <- list(
    status_code = status_code,
    token = bearer_token
  )

  return(result)
}



#' Artist ID döndürür
#'
#' @param artist_name Artist adı girilir
#' @return Artist adına göre yakın isimdeki ID'leri döndürür
#' @export
spotify_search_artist <- function(artist_name) {
  if(!is.character(artist_name)) stop("Artist name must be character type.");

  search_url <- paste0(
    "https://api.spotify.com/v1/search?q=", URLencode(artist_name),
    "&type=artist&limit=",5)
  token <- spotify_token()

  check_spotify_credentials()

  response <- GET(
    url = search_url,
    add_headers("Authorization" = token$token)
  )

  status_code <- status_code(response)

  if (status_code == 200) {
    search_result <- content(response, type = "application/json")
    artists <- search_result$artists$items[seq_len(5)]

    search_results <- data.frame(
      artist = sapply(artists, function(x) x$name),
      id = sapply(artists, function(x) x$id)
    )

    result <- list(
      status_code = status_code,
      search_results = search_results
    )

    return(result)
  }
  else {
    error <- content(response)
    return(error)
  }
}
