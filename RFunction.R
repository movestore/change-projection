library('move')

rFunction <- function(projection, data) {
  if (!is.null(projection)) result <- spTransform(data, CRSobj=projection) else result <- data
  return(result)
}
