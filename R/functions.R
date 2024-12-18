descriptive_stats <- function(data) {
    data |>
        dplyr::group_by(metabolite) |>
        dplyr::summarise(
            dplyr::across(
                value,
                list(
                    mean = mean,
                    sd = sd
                )
            )
        ) |>
        dplyr::mutate(dplyr::across(
            tidyselect::where(is.numeric),
            ~round(.x, digits = 1)
        ))
}

