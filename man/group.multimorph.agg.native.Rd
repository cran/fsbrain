% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/morph_agg.R
\name{group.multimorph.agg.native}
\alias{group.multimorph.agg.native}
\title{Aggregate native space morphometry data for multiple measures over hemispheres for a group of subjects.}
\usage{
group.multimorph.agg.native(
  subjects_dir,
  subjects_list,
  measures,
  hemis,
  agg_fun = mean,
  format = "curv",
  cast = TRUE,
  cortex_only = FALSE,
  agg_fun_extra_params = NULL
)
}
\arguments{
\item{subjects_dir}{string. The FreeSurfer SUBJECTS_DIR, i.e., a directory containing the data for all your subjects, each in a subdir named after the subject identifier.}

\item{subjects_list}{string vector. A vector of subject identifiers that match the directory names within subjects_dir.}

\item{measures}{vector of strings. Names of the vertex-wise morphometry measures. E.g., c("area", "thickness"). Used to construct the names of the morphometry file to be loaded.}

\item{hemis}{string, one of 'lh', 'rh' or 'both'. The hemisphere name. Used to construct the names of the annotation and morphometry data files to be loaded.}

\item{agg_fun}{function. An R function that aggregates data, typically \code{\link{max}}, mean, min or something similar. Note: this is NOT a string, put the function name without quotes. Defaults to mean.}

\item{format}{string. One of 'mgh', 'mgz', 'curv'. Defaults to 'mgh'.}

\item{cast}{Whether a separate 'hemi' column should exist.}

\item{cortex_only}{logical, whether to mask the medial wall, i.e., whether the morphometry data for all vertices which are *not* part of the cortex (as defined by the label file `label/?h.cortex.label`) should be replaced with NA values. In other words, setting this to TRUE will ignore the values of the medial wall between the two hemispheres. If set to true, the mentioned label file needs to exist for the subjects. Also not that the aggregation function will need to be able to cope with NA values if you set this to TRUE. You can use 'agg_fun_extra_params' if needed to achieve that, depending on the function. Foe example, if you use the \code{\link{mean}} function, you could set \code{agg_fun_extra_params=list("na.rm"=TRUE)} to get the mean of the vertices which are not masked. Defaults to FALSE.}

\item{agg_fun_extra_params}{named list, extra parameters to pass to the aggregation function 'agg_fun' besides the loaded morphometry data. This is useful if you have masked the data and need to ignore NA values in the agg_fun.}
}
\value{
dataframe with aggregated values over all measures and hemis for all subjects, with m columns and n rows, where n is the number of subjects. The m columns are 'subject_id' and '<hemi>.<measure>' (e.g., "lh.thickness") for all combinations of hemi and measure, the latter contains the aggregated data.
}
\description{
Compute the mean (or other aggregates) over all vertices of a subject from native space morphometry data (like 'surf/lh.area'). You can specify several measures and hemispheres. Uses knowledge about the FreeSurfer directory structure to load the correct files.
}
\examples{
\dontrun{
    subjects_dir = fsbrain::get_optional_data_filepath("subjects_dir");
    subjects_list = c("subject1", "subject2")
    data = group.multimorph.agg.native(subjects_dir, subjects_list, c("thickness", "area"),
     c("lh", "rh"), cast=FALSE, cortex_only=TRUE, agg_fun=mean,
     agg_fun_extra_params=list("na.rm"=TRUE));
    head(data);
}

}
\seealso{
Other global aggregation functions: 
\code{\link{group.morph.agg.native}()},
\code{\link{group.morph.agg.standard}()},
\code{\link{group.multimorph.agg.standard}()}
}
\concept{global aggregation functions}
