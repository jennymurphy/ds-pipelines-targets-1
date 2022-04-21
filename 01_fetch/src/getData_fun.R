# Function that gets data


getSBdata <- function(childItemID) {
  
  # What's the convention for packages within a function? 
  # Include them? Don't include them?
  require(sbtools)
  
  # Get the data from ScienceBase
  mendota_file <- file.path('01_fetch/out/model_RMSEs.csv')
  item_file_download(childItemID, names = 'me_RMSE.csv', 
                     destinations = mendota_file, overwrite_file = TRUE)
  
}

# To Run:
# getSBdata(childItemID = '5d925066e4b0c4f70d0d0599')