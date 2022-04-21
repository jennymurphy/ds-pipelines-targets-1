library(targets)

source("01_fetch/src/getData_fun.R")
source("02_process/src/prepData_fun.R")
source("02_process/src/saveData_fun.R")
source("03_visualize/src/plotData_fun.R")
source("02_process/src/saveModDiags_fun.R")

tar_option_set(packages = c("tidyverse", "sbtools", "whisker"))
list(
  #get data
  tar_target(model_RMSEs_csv,
             getSBdata(childItemID = '5d925066e4b0c4f70d0d0599',
                       saveFile = '01_fetch/out/model_RMSEs.csv'),
             format = "file"),
  # prep data
  tar_target(eval_data,
             prepData(data_inPath = "01_fetch/out/model_RMSEs.csv")),
  # create plot
  tar_target(fig1_modEval_png,
             plotData(in_data = eval_data, figName = "03_visualize/out/fig1_modEval.png"),
             format = "file"),
  # save processed data
  tar_target(model_summary_results_csv,
             saveData(eval_data, out_file = "02_process/out/model_summary_results.csv"),
              format = "file"),
  # save model diags
  tar_target(model_diagnostic_text_txt,
             saveModDiags(in_data = eval_data, out_file = '02_process/out/model_diagnostic_text.txt'),
             format = "file")
)