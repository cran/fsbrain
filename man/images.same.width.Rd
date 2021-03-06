% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helpers_magick.R
\name{images.same.width}
\alias{images.same.width}
\title{Extent all images to the width of the image with maximal width.}
\usage{
images.same.width(images, background_color = "white")
}
\arguments{
\item{images}{a vector/stack of magick images. See \code{magick::image_blank} or other methods to get one.}

\item{background_color}{hex color string, the background color to use if the images have different sizes and one needs to be extended. Do not use color names like 'gray', which differ between R and magick.}
}
\value{
a vector/stack of magick images, all with the same width.
}
\description{
Extent all images to the width of the image with maximal width.
}
\keyword{internal}
