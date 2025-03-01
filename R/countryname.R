#' Toggle between country names and ISO codes
#'
#' @description Easily convert a country name to its ISO code and vice versa.
#'   Official United Nations country names are used. See `gdidata::countrynames` for full
#'   dictionary.
#'
#' @details Under the default `exact = FALSE`, matching is done using
#'   `stringr::str_detect`, which means keys need not be exact. For example,
#'   `countryname("iran", from = "name", to = "iso3)` will return the correct
#'   ISO code "IRN" even if the dictionary name is "Islamic Republic of Iran".
#'   One can therefore check a country's official name by running
#'   `countryname("iran", from = "name")`.
#'
#'   If there are multiple matches, `countryname()` will only return the first
#'   match. Thus, while "guinea" matches with four countries (Equatorial Guinea,
#'   Guinea, Guinea-Bissau, Papua New Guinea), `countryname("guinea")` will only
#'   return the keys for Equatorial Guinea, which is a problem if one wants to
#'   obtain the keys for Guinea. Set `exact = TRUE` to use exact matching.
#'
#'   Regardless of how `exact` is set, matching remains case-insensitive,
#'
#' @param key (Case-insensitive) name or ISO code of country.
#' @param from Current type of `key`.
#' @param to Target type of `key`.
#' @param exact Whether to use exact matching.
#' @param quiet Turn off warning messages.
#'
#' @return String or vector of strings.
#'
#' @examples
#' countryname(c("deu", "phl"))
#' # "Germany" "Philippines"
#'
#' countryname("germany", from = "name", to = "iso3")
#' # "DEU"
#'
#' countryname("guinea", from = "name")
#' # "Equatorial Guinea"
#'
#' countryname("guinea", from = "name", exact = TRUE)
#' # "Guinea"
#'
#' countryname("united kingdom", from = "name")
#' # "United Kingdom of Great Britain and Northern Ireland"
#'
#' @export
countryname <- function(key,
                        from = "iso3",
                        to = "name",
                        exact = FALSE,
                        quiet = FALSE) {

  # Check if types are valid
  valid_types <- colnames(gdidata::countrynames)
  if(!all(c(from, to) %in% valid_types)) {
    invalid <- c()
    if (!(from %in% valid_types)) {
      invalid <- c(invalid, paste0('"', from, '"'))
    }
    if (!(to %in% valid_types)) {
      invalid <- c(invalid, paste0('"', to, '"'))
    }
    if (length(invalid) > 1) {
      invalid <- paste(
        paste(invalid, collapse = " and "),
        "are not valid types."
      )
    } else {
      invalid <- paste(invalid, "is not a valid type.")
    }
    cli::cli_abort("{invalid}")
  }

  out <- c()
  multi <- data.frame()
  nohits <- c()

  for (k in key) {

    from_col <- gdidata::countrynames[{from}] |> unlist() |> unname()
    to_col <- gdidata::countrynames[{to}] |> unlist() |> unname()

    if (exact) {
      row <- which(tolower(from_col) == tolower(k))
    } else {
      row <- which(
        stringr::str_detect(tolower(from_col),
        paste0("\\b", tolower(k), "\\b"))
      )
    }
    hit <- to_col[row]

    if (length(hit) == 0) {
      nohits <- c(nohits, paste0('"', k, '"'))
      out <- c(out, NA)
    }
    else {
      if (length(hit) > 1) {
        multi <- multi |>
          rbind(data.frame(
            key = paste0('"', k, '"'),
            hit = paste0('"', hit[1], '"')
          ))
      }
      out <- c(out, hit[1])
    }
  }

  if (!quiet & nrow(multi) > 0) {
    multi <- multi |> dplyr::distinct(key, .keep_all = TRUE)
    warn <- c()
    for (row in 1:nrow(multi)) {
      warn <- c(warn, "*" = paste0(multi$key[row], " = ", multi$hit[row]))
    }
    cli::cli_warn(c(
      'The following had multiple matches and only the first was returned. For more control over matching, set `exact = TRUE`.',
      warn
    ))
  }

  if (length(nohits) > 0) {
    if (!quiet) cli::cli_warn(c(
      'Unable to parse the following (returned NA) :',
      "*" = '{paste(unique(nohits), collapse = ", ")}'
    ))
  }

  return(out)
}
