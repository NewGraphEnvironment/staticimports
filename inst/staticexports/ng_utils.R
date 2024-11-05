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
