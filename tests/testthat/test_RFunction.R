library('move2')

test_data <- test_data("input3_move2.rds") #file must be move2!

test_that("no change in projection", {
  actual <- rFunction(data = test_data, projection=NULL, center=NULL, units=NULL)
  expect_equal(sf::st_crs(test_data)$input, sf::st_crs(actual)$input)
})

test_that("check projection", {
  actual <- rFunction(data = test_data, projection="ESRI:54009", center=NULL, units=NULL)
  expect_equal("ESRI:54009", sf::st_crs(actual)$input)
})
