library(jsonlite)
source("logger.R")
source("RFunction.R")

inputFileName = "threeindv.rds"
outputFileName = "output.rds"

args <- list()
#################################################################
########################### Arguments ###########################
# The data parameter will be added automatically if input data is available
# The name of the field in the vector must be exaclty the same as in the r function signature
# Example:
# rFunction = function(username, password)
# The paramter must look like:
#    args[["username"]] = "any-username"
#    args[["password"]] = "any-password"

# Add your arguments of your r function here
#args[["username"]] = "TeamWikelski"
#args[["password"]] = ""
#args[["study"]] = 	10531951 # needs to be study ID!!!
#args[["animals"]] = c("Agnese (0CU6; e-obs 3074)", "Aivo (0A8U; e-obs 3060)", "Dace (0CN7; e-obs 3060)")
#args[["duplicates_handling"]] = "combi" #"first" or "combi"
#args[["timestamp_start"]] = "20130101000000000"
#args[["timestamp_end"]] ="20131215000000000"

args[["username"]] = "andreakoelzsch"
args[["password"]] = ""
args[["study"]] = 		127892189 # needs to be study ID!!!
args[["animals"]] = c("GWFG_2015_429", "GWFG_2015_431")
args[["duplicates_handling"]] = "first" #"first" or "combi"
args[["timestamp_start"]] = "20200501000000000"
args[["timestamp_end"]] ="20241201000000000"

args[["projection"]] = "+proj=moll +ellps=WGS84" # '+proj=moll +ellps=WGS84' #'EPSG:4978', 'ESRI:54009'

#################################################################
#################################################################
inputData <- NULL
if(!is.null(inputFileName) && inputFileName != "" && file.exists(inputFileName)) {
  cat("Loading file from", inputFileName, "\n")
  inputData <- readRDS(file = inputFileName)
} else {
  cat("Skip loading: no input File", "\n")
}

# Add the data paramter if input data is available
if (!is.null(inputData)) {
  args[["data"]] <- inputData
}

result <- tryCatch({
    do.call(rFunction, args)
  },
  error = function(e) { #if in RFunction.R some error are silenced, they come back here and break the app... (?)
    print(paste("ERROR: ", e))
    stop(e) # re-throw the exception
  }
)

if(!is.null(outputFileName) && outputFileName != "" && !is.null(result)) {
  cat("Storing file to", outputFileName, "\n")
  saveRDS(result, file = outputFileName)
} else {
  cat("Skip store result: no output File or result is missing", "\n")
}
