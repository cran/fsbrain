% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vis_surface_background.R
\name{collayer.from.annot}
\alias{collayer.from.annot}
\title{Compute surface color layer from annotation or atlas data.}
\usage{
collayer.from.annot(subjects_dir, subject_id, hemi, atlas)
}
\arguments{
\item{subjects_dir}{character string, the FreeSurfer SUBJECTS_DIR.}

\item{subject_id}{character string, the subject identifier.}

\item{hemi}{character string, one of 'lh', 'rh', or 'both'.}

\item{atlas}{character string, the atlas name. E.g., "aparc", "aparc.2009s", or "aparc.DKTatlas". Used to construct the name of the annotation file to be loaded.}
}
\value{
named hemi list, each entry is a vector of color strings, one color per surface vertex. The coloring represents the atlas data.
}
\description{
Compute surface color layer from annotation or atlas data.
}
\seealso{
You can plot the return value using \code{\link[fsbrain]{vis.color.on.subject}}.

Other surface color layer: 
\code{\link{collayer.bg.atlas}()},
\code{\link{collayer.bg.meancurv}()},
\code{\link{collayer.bg.sulc}()},
\code{\link{collayer.bg}()},
\code{\link{collayer.from.annotdata}()},
\code{\link{collayer.from.mask.data}()},
\code{\link{collayer.from.morphlike.data}()},
\code{\link{collayers.merge}()}
}
\concept{surface color layer}
