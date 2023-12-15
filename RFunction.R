library('move2')
library("sf")

##ToDO: think if adding custom point as center makes sense
# Note: Projection cannot be numeric as intup in appspec is a "string". Maybe it would be nice to have a mixed settings posibiltiy...

rFunction <- function(projection=NULL,center=NULL, units=NULL, data) {
  if(is.null(center) & is.null(units)){
    if(!is.null(projection)){
      result <- sf::st_transform(data, projection)
      logger.info(paste0("The data have been reprojected into: ",projection,"."))
    } 
    if(is.null(projection)){
      result <- data
      logger.warn("No projection has been provided, projection of data stays unchanged.")
    }
  }
  if(!is.null(center) & !is.null(units)){
    aeqd_crs <- mt_aeqd_crs(data, center, units)
    result <- sf::st_transform(data, aeqd_crs)
    logger.info(paste0("The data have been reprojected into a Azimuthal Equidistant (aeqd) projection in '",units,"' centered around the '",center,"' of the locations." ))
  }
  if(!is.null(center) & is.null(units) | is.null(center) & !is.null(units)){
    result <- data
    logger.warn("Center or Unit for the Azimuthal Equidistant projection is missing, projection of data stays unchanged.")
    }
  return(result)
}
