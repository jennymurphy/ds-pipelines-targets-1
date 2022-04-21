# Prepare the data for plotting


library(dplyr)
library(readr)
library(stringr)


prepData <- function(data_inPath) {
  
  eval_data <- readr::read_csv(data_inPath, col_types = 'iccd') %>%
    filter(str_detect(exper_id, 'similar_[0-9]+')) %>%
    mutate(col = case_when(
      model_type == 'pb' ~ '#1b9e77',
      model_type == 'dl' ~'#d95f02',
      model_type == 'pgdl' ~ '#7570b3'
    ), pch = case_when(
      model_type == 'pb' ~ 21,
      model_type == 'dl' ~ 22,
      model_type == 'pgdl' ~ 23
    ), n_prof = as.numeric(str_extract(exper_id, '[0-9]+')))
  
}


# To run:
#  prepData(data_inPath = "01_fetch/out/model_RMSEs.csv")