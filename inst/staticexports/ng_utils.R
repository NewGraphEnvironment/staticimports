# build a function to find empty row using its index
sngu_row_empty_index <- function(dat, position = 1){
  dat |>
    mutate(is_empty_row = dplyr::case_when(
      dplyr::if_all(dplyr::everything(), is.na) ~ TRUE,
      TRUE ~ FALSE
    ),
    index = dplyr::row_number()
    ) |>
    dplyr::filter(is_empty_row ==  TRUE) |>
    dplyr::pull(index) |>
    head(position)
}

# this is necessary to get around R's weird rounding where 1.55 would round to 1.5 vs 1.6 as we would expect.
sngu_round <- function(x, decimal_places = 1) {
  multiplier <- 10^decimal_places
  floor(x * multiplier + 0.5) / multiplier
}
