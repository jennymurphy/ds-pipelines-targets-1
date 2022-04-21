# Function that gets data

library(sbtools)

getSBdata <- function(childItemID, saveFile) {
  
  # Get the data from ScienceBase & save file
  item_file_download(childItemID, names = 'me_RMSE.csv', 
                     destinations = file.path(saveFile), overwrite_file = TRUE)
  
}

# To Run:
# getSBdata(childItemID = '5d925066e4b0c4f70d0d0599', saveFile = '01_fetch/out/model_RMSEs.csv')
