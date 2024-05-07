#' Import MMASH user info data
#'
#' @param file_path Path to user info data file.
#'
#' @return Output of imported info data
import_user_info <- function(file_path) {
  info_data <- readr::read_csv( # add dependency package here
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



#' Import the MMASH saliva file.
#'
#' @param file_path Path to the user saliva data file.
#'
#' @return Outputs a data frame/tibble.
#'
import_saliva <- function(file_path) {
  saliva_data <- readr::read_csv(
    file_path,
    col_select = -1,
    col_types = readr::cols(
      samples = readr::col_character(),
      cortisol_norm = readr::col_double(),
      melatonin_norm = readr::col_double()
    ),
    name_repair = snakecase::to_snake_case
  )
  return(saliva_data)
}

# Test that this works
# import_saliva(here("data-raw/mmash/user_1/saliva.csv"))


#' Title Importing multiple files at the same time using rbind
#'
#' @param file_pattern
#' @param import_function
#'
#' @return Output of imported multiple files
import_multiple_files <- function(file_pattern, import_function) {
  data_files <- fs::dir_ls(here("data-raw/mmash/"),
    regexp = file_pattern,
    recurse = TRUE
  )
  combined_data <- purrr::map(data_files, import_function) |>
    purrr::list_rbind(names_to = "file_path_id")
  return(combined_data)
}


