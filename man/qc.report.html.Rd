% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/seg_stats.R
\name{qc.report.html}
\alias{qc.report.html}
\title{Create visual quality check report from QC result.}
\usage{
qc.report.html(
  subjects_dir,
  subjects_list,
  out_dir = "fsbrain_qc_report",
  subjects_metadata = list(),
  qc = NULL,
  ...
)
}
\arguments{
\item{subjects_dir}{string. The FreeSurfer SUBJECTS_DIR, i.e., a directory containing the data for all your subjects, each in a subdir named after the subject identifier.}

\item{subjects_list}{string vector. A vector of subject identifiers that match the directory names within subjects_dir.}

\item{out_dir}{character string, path to output dir. The last directory part will be created if it does not exist (but not recursively).}

\item{subjects_metadata}{named list, keys can be subjects from subjects_list. Each key can hold another named list of strings, represeting arbitrary metadata for that subject that will be displayed in the report.}

\item{qc}{optional qc result. If NULL, a QC report is created using standard settings 'aparc' and 'thickness'.}

\item{...}{passed on to \code{subject.report.html}.}
}
\description{
Create visual quality check report from QC result.
}
\examples{
\dontrun{
s = sjld("~/data/IXI_min/mri/freesurfer");
s$l = s$l[1:100]; # first few subjects are enough
fsbrain:::qc.report.html(s$d, s$l);
}

}
\keyword{internal}
