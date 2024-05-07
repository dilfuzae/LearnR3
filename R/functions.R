#' Import MMASH user info data
#'
#' @param file_path Path to user info data file.
#'
#' @return Output of imported info data
import_user_info <- function(file_path) {
  info_data <- readr::read_csv( #add dependency package here
    file_path,
    col_select = -1, # col skip (deletes the column)
    col_types = readr::cols(
      readr::col_skip(),
      gender = readr::col_character(),
      weight = readr::col_double(),
      height = readr::col_double(),
      age = readr::col_double()
    ),
    name_repair = snakecase::to_snake_case
  )

  return(info_data)

}



#' Title Import RR data
#'
#' @param file_path Path to RR data file
#'
#' @return Output of imported RR data
import_rr <- function(file_path) {
  rr_data <- readr::read_csv(
    file_path,
    col_select = -1,
    col_types = readr::cols(
      ibi_s = readr::col_double(),
      day = readr::col_integer(),
      time = readr::col_time(format = ""),
      .delim = ","
    ),
    name_repair = snakecase::to_snake_case
  )

  return(rr_data)
}


#' Title MASH Actigraph file
#'
#' @param file_path path to user 1 Actigraph file
#'
#' @return Output of imported Actigraph data
import_actigraph <- function(file_path) {
  actigraph_data <- readr::read_csv(
    file_path,
    col_select = -1,
    col_types = readr::cols(
      axis_1 = readr::col_double(),
      axis_2 = readr::col_double(),
      axis_3 = readr::col_double(),
      steps = readr::col_double(),
      hr = readr::col_double(),
      inclinometer_off = readr::col_double(),
      inclinometer_standing = readr::col_double(),
      inclinometer_sitting = readr::col_double(),
      inclinometer_lying = readr::col_double(),
      vector_magnitude = readr::col_double(),
      day = readr::col_double(),
      time = readr::col_time(format = ""),
      .delim = ","
    ),
    name_repair = snakecase::to_snake_case
  )
  return(actigraph_data)
}
}
