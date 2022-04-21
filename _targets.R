library(targets)
source("code.R")
tar_option_set(packages = c("tidyverse", "sbtools", "whisker"))
list(
  #get data
  tar_target(model_RMSEs_csv,
             getSBdata(childItemID = '5d925066e4b0c4f70d0d0599',
                       saveFile = '01_fetch/out/model_RMSEs.csv'),
             format = "files"),
  # prep data
  tar_target(eval_data,
             prepData_fun(savePath = "02_process/out/preppedData.rds"),
             format = "file"),
  # create plot
  tar_target(fig1_modEval.png,
             plotData("03_visualize/out/figure_1/fig1.png", eval_data),
             format = "file"),
  # save processed data
  targ_target(model_smry_results_csv,
              write_csv(eval_data, file = "model_summary_results.csv"),
              foramt = "file"),
  # save model diags
  tar_target(model_diagnostic_text_txt,
             saveModDiags_fun("02_process/out/preppedData.rds"),
             format = "file")
)