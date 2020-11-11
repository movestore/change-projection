# Change Projection
MoveApps

Github repository: *github.com/movestore/change-projection*

## Description
Change the projection of the movement data. 

## Documentation

This App reads in Movement data, transforms the geographical projection of all locations to the requested one and returns them as Movement data. Take care to provide a valid projection code in CRS format.

### Input data
moveStack in Movebank format

### Output data
moveStack in Movebank format

### Artefacts
none

### Parameters 
`projection`: string variable in CRS format describing the required coordinate reference system of the geographical coordiantes. See the PROJ or PROJ.4 projection and transformation system or EPSG codes. Example: “+proj=longlat +ellps=WGS84”.

### Null or error handling:
**Parameter `projection`:** If this parameter is left empty (NULL), a warning is given, the data is not transformed and returned in its original format. If an incorrect CRS code is given, the appropriate error message is given from R and the App stops.

**Data:** This App is not reducing the data in any form, so no empty tracks can occur. The output data set should have the same dimensions as the input.
