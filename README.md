# Change Projection
MoveApps

Github repository: *github.com/movestore/change-projection*

## Description
Change the projection of the movement data. 

## Documentation
This App transforms the geographical projection of all locations to the requested one. 

There are two options:

1. The projection can be provided in a *EPGS* (e.g.: "EPSG:4326"), *ESRI* (e.g.: "ESRI:54009") or *Proj.4* format (e.g.: "+proj=longlat +datum=WGS84 +no_defs +type=crs"). The webpages https://epsg.io/ and https://spatialreference.org/ can be of help finding a projection.

2. Tracking data can be projected to a Azimuthal Equidistant (aeqd) projection, in `m` or `km` and centering the projection around the `center` or the `centroid` of the trajectory.
The `center` is calculated as the midpoint of the range of coordinates of the trajectory. The `centroid` is the mean point position.

### Input data
move2_loc

### Output data
move2_loc

### Artefacts
none

### Settings 
`Projection`: string stating the projection. It can be in a *EPGS* (e.g.: "EPSG:4326"), *ESRI* (e.g.: "ESRI:54009") or *Proj.4* format (e.g.: "+proj=longlat +datum=WGS84 +no_defs +type=crs").

`Azimuthal Equidistant center`: the method to identify the coordinates of the center of the trajectory. Options are: `center` calculates the midpoint of the range of coordinates of the trajectory and `centroid` calculates the mean point position.

`Azimuthal Equidistant units`: the units of the Azimuthal Equidistant projection. Options are `m` or `km`.

### Null or error handling:
**Setting `Projection`:** If this all three settings are left empty, a warning is given, the data is not transformed and returned in its original format. If an incorrect CRS code is given, the appropriate error message is given from R and the App stops. If `Azimuthal Equidistant center` and `Azimuthal Equidistant units` are provided the `Projection` setting is ignored.

**Settings `Azimuthal Equidistant center` and `Azimuthal Equidistant units`:** to use the Azimuthal Equidistant projection both of these settings have to be provided (the `Projection` setting will be ignored). If one is missing, the data is not transformed and returned in its original format.

**Data:** The output contains the same data as the input but in another projection.
