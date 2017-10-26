[![Build Status](https://travis-ci.org/khufkens/daymetr.svg?branch=master)](https://travis-ci.org/khufkens/daymetr)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.437886.svg)](https://doi.org/10.5281/zenodo.437886)

# daymetr

The **daymetr** R package provides functions to (batch) download single pixel or gridded [daymet data](http://daymet.ornl.gov/) (tiled) data directly into your R workspace, or save them as csv/tif files on your computer. Gridded (tiled) data downloads for a region of interest are specified by a top left / bottom right coordinate pair or a single pixel location. To properly cite this package see the reference at the end of the page.

## Installation

clone the project to your home computer using the following command (with git installed)

```R
if(!require(devtools)){install.package(devtools)}
devtools::install_github("khufkens/daymetr")
library(daymetr)
```

## Use

### Single pixel location download

For a single site use the following format

```R
download_daymet(site = "Oak Ridge National Laboratories",
                lat = 36.0133,
                lon = -84.2625,
                start = 1980,
                end = 2010,
                internal = TRUE)
```

Parameter     | Description                      
------------- | ------------------------------ 	
site	      | site name
lat           | latitude of the site
lon           | longitude of the site
start      | start year of the time series (data start in 1980)
end        | end year of the time series (current year - 2 years / for safety, tweak this check to reflect the currently available data)
internal      | logical, TRUE or FALSE, if true data is imported into R workspace otherwise it is downloaded into the current working directory

Batch mode uses similar parameters but you provide a comma separated file with site names and latitude longitude which are sequentially downloaded. Format of the comma separated file is as such: site name, latitude, longitude.

```R
download_daymet_batch(file_location = 'my_sites.csv',
                      start = 1980,
                      end = 2010,
                      internal = TRUE)
```

### Gridded data downloads

For gridded data use either download_daymet_tiles() for individual tiles or download_daymet_ncss() for a netCDF subset which is not bound by tile limits (but restricted to a 6GB query size).

#### *Tiled data*

```R
download_daymet_tiles(location = c(36.0133,-84.2625),
                      tiles = NULL,
                      start = 1980,
                      end = 2012,
                      param = "ALL")
```

Parameter     | Description                      
------------- | ------------------------------ 	
location	      | vector with a point location c(lat,lon) or top left / bottom right pair c(lat,lon,lat,lon)
tiles          | vector with tile numbers if location point or top left / bottom right pair is not provided
start      | start year of the time series (data start in 1980)
end        | end year of the time series (current year - 2 years / for safety, tweak this check to reflect the currently available data)
param         | climate variable you want to download vapour pressure (vp), minimum and maximum temperature (tmin,tmax), snow water equivalent (swe), solar radiation (srad), precipitation (prcp) , day length (dayl). The default setting is ALL, this will download all the previously mentioned climate variables.

If only the first set of coordinates is provided the tile in which these reside is downloaded. If your region of interest falls outside the scope of the DAYMET data coverage a warning is issued. If both top left and bottom right coordinates are provided all tiles covering the region of interst are downloaded. I would caution against downloading too much data, as file sizes do add up. So be careful how you specify your region of interest.

#### *netCDF subset (ncss) data*

```R
download_daymet_ncss(location = c(36.61,-85.37,-81.29,33.57),
                     start = 1980,
                     end = 1980,
                     param = "tmin")
```

Parameter     | Description                      
------------- | ------------------------------ 	
location	      | bounding box extent defined as top left / bottom right pair c(lat,lon,lat,lon)
start      | start year of the time series (data start in 1980)
end        | end year of the time series (current year - 2 years / for safety, tweak this check to reflect the currently available data)
param         | climate variable you want to download vapour pressure (vp), minimum and maximum temperature (tmin,tmax), snow water equivalent (swe), solar radiation (srad), precipitation (prcp) , day length (dayl). The default setting is ALL, this will download all the previously mentioned climate variables.

Keep in mind that the bounding box is defined by the minimum (square) bounding box in a Lambert Conformal Conic (LCC) projection as defined by the provided geographic coordinates. In general the query area will be larger than the requested location. For more information I refer to [Daymet documentation](https://daymet.ornl.gov/web_services.html) on the web service.


## Reference

Hufkens K., Basler J. D., Milliman T. Melaas E., Richardson A.D. 2017 An integrated phenology modelling framework in R: Phenology modelling with phenor. Methods in Ecology & Evolution (in review).

## Acknowledgements

This project was is supported by the National Science Foundation’s Macro-system Biology Program (award EF-1065029).
