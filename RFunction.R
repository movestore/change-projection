library('move')

rFunction <- function(projection, data) {
  spTransform(data, CRSobj=projection)
}
