# write the contents of the NEWS.md file to a RMD file that will be included as an appendix
my_news_to_appendix <- function(
    md_name = "NEWS.md",
    rmd_name = "2090-report-change-log.Rmd",
    appendix_title = "# Changelog") {

  # Read and modify the contents of the markdown file
  news_md <- readLines(md_name)
  news_md <- stringr::str_replace(news_md, "^#", "###") |>
    stringr::str_replace_all("(^(### .*?$))", "\\1 {-}")

  # Write the title, a blank line, and the modified contents to the Rmd file
  writeLines(
    c(paste0(appendix_title, " {-}"), "", news_md),
    rmd_name
  )
}

my_dt_table <-   function(dat,
                          cols_freeze_left = 3,
                          page_length = 10,
                          col_align = 'dt-center', #'dt-right',
                          font_size = '11px',
                          style_input = 'bootstrap'){

  dat |>
    DT::datatable(
      # style = style_input,
      class = 'cell-border stripe', #'dark' '.table-dark',
      #https://stackoverflow.com/questions/36062493/r-and-dt-show-filter-option-on-specific-columns
      filter = 'top',
      extensions = c("Buttons","FixedColumns", "ColReorder"),
      rownames= FALSE,
      options=list(
        scrollX = TRUE,
        columnDefs = list(list(className = col_align, targets = "_all")), ##just added this
        pageLength = page_length,
        dom = 'lrtipB',
        buttons = c('excel','csv'),
        fixedColumns = list(leftColumns = cols_freeze_left),
        lengthMenu = list(c(5,10,25,50,-1),
                          c(5,10,25,50,"All")),
        colReorder = TRUE,
        #https://stackoverflow.com/questions/44101055/changing-font-size-in-r-datatables-dt
        initComplete = htmlwidgets::JS(glue::glue(
          "function(settings, json) {{ $(this.api().table().container()).css({{'font-size': '{font_size}'}}); }}"
        ))
        #https://github.com/rstudio/DT/issues/1085 - dark theme not working yet
        #   initComplete = JS(
        #     'function() {$("html").attr("data-bs-theme", "dark");}')
      )
    )
  # https://stackoverflow.com/questions/42099418/how-can-i-reduce-row-height-in-dt-datatables - cant get
  # DT::formatStyle(0, target= 'row', lineHeight = row_height_max)
}

#https://stackoverflow.com/questions/49819892/cross-referencing-dtdatatable-in-bookdown
my_tab_caption <- function(caption_text = my_caption) {
  # requires results="asis" in chunk header and only works in rmarkdown and not quarto
  cat(
    "<table>",
    paste0(
      "<caption>",
      "(#tab:",
      # this is the chunk name!!
      knitr::opts_current$get()$label,
      ")",
      caption_text,
      "</caption>"
    ),
    "</table>",
    sep = "\n"
  )
}


# default for full mobile function was height =500, width=780.
my_leaflet <- function(height = 650, width = 970){
  leaflet::leaflet(height = height, width = width) |>
    leaflet::addTiles() |>
    leaflet::addProviderTiles("Esri.WorldImagery", group = "Ortho") |>
    leaflet::addProviderTiles("Esri.WorldTopoMap", group = "Topo") |>
    leaflet.extras::addFullscreenControl()
}


# put together a table for viewing in a report.  just makes it reasonable in size putting random
# columns beside eachother.
my_untidy_table <- function(d){
  d_prep <- d %>%
    tibble::rownames_to_column() %>%
    mutate(rowname = as.numeric(rowname),
           col_id = case_when(rowname <= ceiling(nrow(.)/2) ~ 1,
                              T ~ 2)) %>%
    select(-rowname)
  d1 <- d_prep %>%
    filter(col_id == 1) %>%
    select(-col_id)
  d1$row_match <- seq(1:nrow(d1))
  d2 <- d_prep %>%
    filter(col_id == 2) %>%
    select(-col_id) %>%
    purrr::set_names(nm = '-')
  d2$row_match <- seq(1:nrow(d2))
  ##join them together
  d_joined <- left_join(d1, d2, by = 'row_match') %>%
    select(-row_match)
}

# not sure if we should implement this in ngr yet due to httr2 dependency. leaving here for now
lngr_chk_url_response <- function(url, url_response = 200) {
  response <- tryCatch(
    httr2::request(url) |>
      httr2::req_perform(),
    error = function(e) e
  )
  if (inherits(response, "error")) {
    return(FALSE)
  }
  httr2::resp_status(response) == url_response
}

# lngr_chk_url_response("https://www.github.com")
# lngr_chk_url_response("testthis")
# lngr_chk_url_response("https://www.newgraphenvironment.com/whopsie-daisy")
