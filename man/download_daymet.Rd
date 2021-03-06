% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/download_daymet.r
\name{download_daymet}
\alias{download_daymet}
\title{Function to download single location 'Daymet' data}
\usage{
download_daymet(site = "Daymet", lat = 36.0133, lon = -84.2625,
  start = 2000, end = as.numeric(format(Sys.time(), "\%Y")) - 1,
  path = ".", internal = TRUE, quiet = FALSE, force = FALSE)
}
\arguments{
\item{site}{the site name.}

\item{lat}{latitude (decimal degrees)}

\item{lon}{longitude (decimal degrees)}

\item{start}{start of the range of years over which to download data}

\item{end}{end of the range of years over which to download data}

\item{path}{set path where to save the data if internal = FALSE, default is 
the current working directory (default = ".")}

\item{internal}{\code{TRUE} or \code{FALSE}, if \code{TRUE} returns a list to the R workspace if
\code{FALSE} puts the downloaded data into the current working directory
(default = \code{FALSE})}

\item{quiet}{\code{TRUE} or \code{FALSE} (default), to provide verbose output}

\item{force}{\code{TRUE} or \code{FALSE} (default), override the conservative end year setting}
}
\value{
Daymet data for a point location, returned to the R workspace or
written to disk as a csv file.
}
\description{
Function to download single location 'Daymet' data
}
\examples{

\dontrun{
daymet_data = download_daymet("testsite_name",
                lat = 36.0133,
                lon = -84.2625,
                start = 2000,
                internal = TRUE)
}
}
\keyword{Daymet,}
\keyword{climate}
\keyword{data,}
\keyword{pixel}
\keyword{single}
