% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vis.R
\name{vis.symmetric.data.on.subject}
\alias{vis.symmetric.data.on.subject}
\title{Visualize clusters or activation data on the surface of any subject.}
\usage{
vis.symmetric.data.on.subject(
  subjects_dir,
  vis_subject_id,
  morph_data_lh = NULL,
  morph_data_rh = NULL,
  surface = "white",
  views = c("t4"),
  rgloptions = rglo(),
  rglactions = list(),
  draw_colorbar = TRUE,
  makecmap_options = list(colFn = cm.cbry(), symm = TRUE, col.na = "#FFFFFF00", n = 200),
  map_to_NA = c(0),
  bg = NULL,
  morph_data_both = NULL,
  style = "default"
)
}
\arguments{
\item{subjects_dir}{string. The FreeSurfer SUBJECTS_DIR, i.e., a directory containing the data for all your subjects, each in a subdir named after the subject identifier.}

\item{vis_subject_id}{string. The subject identifier from which to obtain the surface for data visualization. Example: 'fsaverage'.}

\item{morph_data_lh}{numeric vector or character string or NULL, the data to visualize on the left hemisphere surface. If a string, it is treated as a filename and data is loaded from it first. When it is a numerical vector, this is assumed to be the data already. The data must have the same length as the surface of the vis_subject_id has vertices. If NULL, this surface will not be rendered. Only one of morph_data_lh or morph_data_rh is allowed to be NULL.}

\item{morph_data_rh}{numeric vector or character string or NULL, the data to visualize on the right hemisphere surface. If a string, it is treated as a filename and data is loaded from it first. When it is a numerical vector, this is assumed to be the data already.  The data must have the same length as the surface of the vis_subject_id has vertices. If NULL, this surface will not be rendered. Only one of morph_data_lh or morph_data_rh is allowed to be NULL.}

\item{surface}{string. The display surface. E.g., "white", "pial", or "inflated". Defaults to "white".}

\item{views}{list of strings. Valid entries include: 'si': single interactive view. 't4': tiled view showing the brain from 4 angles. 't9': tiled view showing the brain from 9 angles.}

\item{rgloptions}{option list passed to \code{\link{par3d}}. Example: \code{rgloptions = list("windowRect"=c(50,50,1000,1000))}.}

\item{rglactions}{named list. A list in which the names are from a set of pre-defined actions. The values can be used to specify parameters for the action. The following example clips outliers in the data before plotting and writes a screenshot in PNG format: \code{rglactions = list("snapshot_png"="~/fsbrain.png", "clip_data"=c(0.05, 0.95))}. See \code{\link{rglactions}}.}

\item{draw_colorbar}{logical or one of the character strings 'vertical' or 'horizontal', whether to draw a colorbar. Notice: the colorbar is drawn to a separate subplot, and this only works if there is enough space for it, i.e., the plot resolution must be high enough. You may have to increase the plot size for the colorbar to show up, see the vignette for instructions. Defaults to `FALSE`. See  \code{\link[fsbrain]{coloredmesh.plot.colorbar.separate}} for an alternative.}

\item{makecmap_options}{named list of parameters to pass to \code{\link{makecmap}}. Must not include the unnamed first parameter, which is derived from 'measure'. Should include at least a colormap function as name 'colFn'.}

\item{map_to_NA}{the value or value range that should **not** be considered a cluster, and should thus be plotted as background color. These values will be set to NA, leading to transparcent rendering, so the background will be visible instead. If a single value, only exactly this value is used (typically 0). If two values, they are interpreted as a range, and a values between them are mapped to NA. If you prefer to map the data to NA yourself before using this function or do not want to use a , pass `NULL`.}

\item{bg}{a background definition. Can be a surface color layer or a character string like 'curv_light' to select a pre-defined layer, see \code{\link[fsbrain]{collayer.bg}} for valid strings.}

\item{morph_data_both}{numeric vector or NULL, the data to visualize on both hemispheres. This must be a single vector with length equal to the sum of the vertex counts of the left and the right hemisphere. The data for the left hemisphere must come first. If this is given, 'morph_data_lh' and 'morph_data_rh' must be NULL.}

\item{style}{character string, a rendering style, e.g., 'default', 'shiny' or 'semitransparent'.}
}
\value{
list of coloredmeshes. The coloredmeshes used for the visualization.
}
\description{
This function is intended to plot symmetric data around zero (like positive and negative activation data, signed p-values, etc.) on a subject's surface. It is a thin wrapper around \code{\link[fsbrain]{vis.data.on.subject}}.
}
\examples{
\dontrun{
   fsbrain::download_optional_data();
   subjects_dir = fsbrain::get_optional_data_filepath("subjects_dir");
   morph_data_lh = subject.morph.native(subjects_dir, 'subject1', 'thickness', 'lh');
   morph_data_rh = NULL;
   vis.symmetric.data.on.subject(subjects_dir, 'subject1', morph_data_lh, morph_data_rh);
}

}
\seealso{
Other visualization functions: 
\code{\link{highlight.vertices.on.subject.spheres}()},
\code{\link{highlight.vertices.on.subject}()},
\code{\link{vis.color.on.subject}()},
\code{\link{vis.data.on.fsaverage}()},
\code{\link{vis.data.on.subject}()},
\code{\link{vis.labeldata.on.subject}()},
\code{\link{vis.mask.on.subject}()},
\code{\link{vis.region.values.on.subject}()},
\code{\link{vis.subject.annot}()},
\code{\link{vis.subject.label}()},
\code{\link{vis.subject.morph.native}()},
\code{\link{vis.subject.morph.standard}()},
\code{\link{vis.subject.pre}()},
\code{\link{vislayout.from.coloredmeshes}()}

Other morphometry visualization functions: 
\code{\link{vis.data.on.fsaverage}()},
\code{\link{vis.data.on.subject}()},
\code{\link{vis.subject.morph.native}()},
\code{\link{vis.subject.morph.standard}()}
}
\concept{morphometry visualization functions}
\concept{visualization functions}
