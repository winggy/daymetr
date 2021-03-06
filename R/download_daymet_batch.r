#' This function downloads 'Daymet' data for several single pixel
#' location, as specified by a batch file.
#' 
#' @param batch_file file with several site locations and coordinates
#' in a comma delimited format: site, latitude, longitude
#' @param start start of the range of years over which to download data
#' @param end end of the range of years over which to download data
#' @param internal assign or FALSE, load data into workspace or save to disc
#' @param force TRUE or FALSE, override the conservative end year setting
#' @return Daymet data for point locations as a nested list or
#' data written to csv files
#' @keywords DAYMET, climate data
#' @export
#' @examples
#'
#' \dontrun{
#' download_daymet_batch(file_location = "yourlocations.csv")
#' }

download_daymet_batch <- function(batch_file,
                                  start = 1980,
                                  end = as.numeric(format(Sys.time(), "%Y"))-1,
                                  internal = TRUE,
                                  force = FALSE){

  # read table with sites and coordinates
  locations = utils::read.table(batch_file, sep=',')

  # loop over all lines in the file return
  # nested list
  apply(locations, 1, function(location){
    site = as.character(location[1])
    lat = as.numeric(location[2])
    lon = as.numeric(location[3])
    try(download_daymet(
      site = site,
      lat = lat,
      lon = lon,
      start = start,
      end = end,
      internal = internal,
      force = force
    ),
    silent = FALSE)
  })
}
