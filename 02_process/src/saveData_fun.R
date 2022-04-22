# saveData

library(readr)

saveData <- function (data, out_file) {
  
  readr::write_csv(data, file = out_file)
  return(out_file)
  
}
