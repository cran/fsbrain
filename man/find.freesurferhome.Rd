% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helpers.R
\name{find.freesurferhome}
\alias{find.freesurferhome}
\title{Find the FREESURFER_HOME directory on disk.}
\usage{
find.freesurferhome(mustWork = FALSE)
}
\arguments{
\item{mustWork}{logical. Whether the function should with an error stop if the directory cannot be found. If this is TRUE, the return value will be only the 'found_at' entry of the list (i.e., only the path of the FreeSurfer installation dir).}
}
\value{
named list with the following entries: "found": logical, whether it was found. "found_at": Only set if found=TRUE, the path to the FreeSurfer installation directory (including the directory itself). See 'mustWork' for important information.
}
\description{
Try to find directory containing the FreeSurfer installation, based on environment variables and *educated guessing*.
}
\seealso{
\code{\link{fs.home}}
}
