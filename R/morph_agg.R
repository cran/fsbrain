

#' @title Aggregate native space morphometry data over one hemisphere for a group of subjects.
#'
#' @description Compute the mean (or other aggregates) over all vertices of a subject from native space morphometry data (like 'surf/lh.area'). Uses knowledge about the FreeSurfer directory structure to load the correct file.
#'
#' @inheritParams group.multimorph.agg.standard
#'
#' @param hemi, string, one of 'lh', 'rh' or 'both'. The hemisphere name. Used to construct the names of the annotation and morphometry data files to be loaded.
#'
#' @param measure, string. Name of the vertex-wise measure of morphometry data file. E.g., "area" or "thickness". Used to construct the name of the morphometry file to be loaded.
#'
#' @return dataframe with aggregated values for all subjects, with 3 columns and n rows, where n is the number of subjects. The 3 columns are 'subject_id', 'hemi', and '<measure>' (e.g., "thickness"), the latter contains the aggregated data.
#'
#' @family global aggregation functions
#'
#' @examples
#' \dontrun{
#'    fsbrain::download_optional_data();
#'    subjects_dir = fsbrain::get_optional_data_filepath("subjects_dir");
#'    subjects_list = c("subject1", "subject2");
#'    fulldata = group.morph.agg.native(subjects_dir, subjects_list, "thickness", "lh");
#'    head(fulldata);
#' }
#'
#' @export
#' @importFrom utils modifyList
group.morph.agg.native <- function(subjects_dir, subjects_list, measure, hemi, agg_fun = mean, cast=TRUE, format='curv', cortex_only=FALSE, agg_fun_extra_params=NULL) {
  if(!(hemi %in% c("lh", "rh", "both"))) {
    stop(sprintf("Parameter 'hemi' must be one of 'lh', 'rh' or 'both' but is '%s'.\n", hemi));
  }

  check.subjectslist(subjects_list, subjects_dir=subjects_dir);

  agg_all_subjects = data.frame();
  for (subject_id in subjects_list) {
      morph_data = subject.morph.native(subjects_dir, subject_id, measure, hemi, format=format, cortex_only=cortex_only);

      # Merge extra arguments to pass to the aggregation function.
      agg_fun_default_params = list(morph_data);
      if( ! is.null(agg_fun_extra_params)) {
        agg_fun_params = modifyList(agg_fun_default_params, agg_fun_extra_params);
      } else {
        agg_fun_params = agg_fun_default_params;
      }

      if(nrow(agg_all_subjects) == 0) {
        if(cast) {
          agg_all_subjects = data.frame(c(as.character(subject_id)), hemi, measure, do.call(agg_fun, agg_fun_params), stringsAsFactors = FALSE);
        } else {
          agg_all_subjects = data.frame(c(as.character(subject_id)), do.call(agg_fun, agg_fun_params), stringsAsFactors = FALSE);
        }
      } else {
        if(cast) {
          agg_all_subjects = rbind(agg_all_subjects, c(as.character(subject_id), hemi, measure, do.call(agg_fun, agg_fun_params)));
        } else {
          agg_all_subjects = rbind(agg_all_subjects, c(as.character(subject_id), do.call(agg_fun, agg_fun_params)));
        }
      }
  }

  if(cast){
    value_column_name = measure;
    colnames(agg_all_subjects) = c("subject_id", "hemi", "measure_name", "measure_value");
    agg_all_subjects$measure_value = as.numeric(agg_all_subjects$measure_value);
  } else {
    value_column_name = sprintf("%s.%s", hemi, measure);
    colnames(agg_all_subjects) = c("subject_id", value_column_name);
    agg_all_subjects[[value_column_name]] = as.numeric(agg_all_subjects[[value_column_name]]);
  }

  return(agg_all_subjects);
}




#' @title Aggregate standard space (fsaverage) morphometry data over one hemisphere for a group of subjects.
#'
#' @description Compute the mean (or other aggregates) over all vertices of a subject from standard space morphometry data (like 'surf/lh.area.fwhm10.fsaverage.mgh'). Uses knowledge about the FreeSurfer directory structure to load the correct file.
#'
#' @inheritParams group.multimorph.agg.standard
#'
#' @param hemi, string, one of 'lh', 'rh' or 'both'. The hemisphere name. Used to construct the names of the annotation and morphometry data files to be loaded.
#'
#' @param measure, string. Name of the vertex-wise measure of morphometry data file. E.g., "area" or "thickness". Used to construct the name of the morphometry file to be loaded.
#'
#' @return dataframe with aggregated values for all subjects, with 2 columns and n rows, where n is the number of subjects. The 2 columns are 'subject_id' and '<hemi>.<measure>' (e.g., "lh.thickness"), the latter contains the aggregated data.
#'
#' @family global aggregation functions
#'
#' @export
#' @importFrom utils modifyList
group.morph.agg.standard <- function(subjects_dir, subjects_list, measure, hemi, fwhm, agg_fun = mean, template_subject='fsaverage', format='mgh', cast=TRUE, cortex_only=FALSE, agg_fun_extra_params=NULL) {
  if(!(hemi %in% c("lh", "rh", "both"))) {
    stop(sprintf("Parameter 'hemi' must be one of 'lh', 'rh' or 'both' but is '%s'.\n", hemi));
  }

  check.subjectslist(subjects_list, subjects_dir=subjects_dir);

  agg_all_subjects = data.frame();
  for (subject_id in subjects_list) {
    morph_data = subject.morph.standard(subjects_dir, subject_id, measure, hemi, fwhm=fwhm, template_subject=template_subject, format=format, cortex_only=cortex_only);

    # Merge extra arguments to pass to the aggregation function.
    agg_fun_default_params = list(morph_data);
    if( ! is.null(agg_fun_extra_params)) {
      agg_fun_params = modifyList(agg_fun_default_params, agg_fun_extra_params);
    } else {
      agg_fun_params = agg_fun_default_params;
    }

    if(nrow(agg_all_subjects) == 0) {
      if(cast) {
        agg_all_subjects = data.frame(c(as.character(subject_id)), hemi, measure, as.numeric(do.call(agg_fun, agg_fun_params)), stringsAsFactors = FALSE);
      } else {
        agg_all_subjects = data.frame(c(as.character(subject_id)), as.numeric(do.call(agg_fun, agg_fun_params)), stringsAsFactors = FALSE);
      }
    } else {
      if(cast) {
        agg_all_subjects = rbind(agg_all_subjects, c(as.character(subject_id), hemi, measure, as.numeric(do.call(agg_fun, agg_fun_params))));
      } else {
        agg_all_subjects = rbind(agg_all_subjects, c(as.character(subject_id), as.numeric(do.call(agg_fun, agg_fun_params))));
      }
    }
  }

  if(cast){
    colnames(agg_all_subjects) = c("subject_id", "hemi", "measure_name", "measure_value");
    agg_all_subjects$measure_value = as.numeric(agg_all_subjects$measure_value);
  } else {
    value_column_name = sprintf("%s.%s", hemi, measure);
    colnames(agg_all_subjects) = c("subject_id", value_column_name);
    agg_all_subjects[[value_column_name]] = as.numeric(agg_all_subjects[[value_column_name]]);
  }

  return(agg_all_subjects);
}




#' @title Aggregate standard space morphometry data over subjects.
#'
#' @description Aggregate vertex-wise values over subjects, leading to one aggregated measure per vertex.
#'
#' @inheritParams group.morph.agg.standard
#'
#' @param split_by_hemi logical, whether to return a hemilist
#'
#' @family aggregation functions
#'
#' @importFrom utils modifyList
#' @export
group.morph.agg.standard.vertex <- function(subjects_dir, subjects_list, measure, hemi, fwhm, agg_fun = mean, template_subject='fsaverage', format='mgh', cortex_only=FALSE, agg_fun_extra_params=NULL, split_by_hemi=FALSE) {

    if(!(hemi %in% c("lh", "rh", "both"))) {
        stop(sprintf("Parameter 'hemi' must be one of 'lh', 'rh' or 'both' but is '%s'.\n", hemi));
    }

    check.subjectslist(subjects_list, subjects_dir=subjects_dir);

    if(split_by_hemi) {
        ret_list = list();
        if(hemi %in% c("lh", "both")) {
            ret_list$lh = group.morph.agg.standard.vertex(subjects_dir, subjects_list, measure, 'lh', fwhm, agg_fun=agg_fun, template_subject=template_subject, format=format, cortex_only=cortex_only, agg_fun_extra_params=agg_fun_extra_params);
        }
        if(hemi %in% c("rh", "both")) {
            ret_list$rh = group.morph.agg.standard.vertex(subjects_dir, subjects_list, measure, 'rh', fwhm, agg_fun=agg_fun, template_subject=template_subject, format=format, cortex_only=cortex_only, agg_fun_extra_params=agg_fun_extra_params);
        }
        return(ret_list);
    }

    df = group.morph.standard(subjects_dir, subjects_list, measure, hemi=hemi, fwhm=fwhm, template_subject=template_subject, format=format, cortex_only=cortex_only, df=TRUE);

    df_axis = 1;
    agg_fun_default_params = list(df, df_axis, agg_fun);
    if( ! is.null(agg_fun_extra_params)) {
        agg_fun_params = modifyList(agg_fun_default_params, agg_fun_extra_params);
    } else {
        agg_fun_params = agg_fun_default_params;
    }
    vert_agg = do.call(apply, agg_fun_params);
    names(vert_agg) = NULL;
    return(vert_agg);
}


#' @title Aggregate standard space (fsaverage) morphometry data for multiple measures over hemispheres for a group of subjects.
#'
#' @description Compute the mean (or other aggregates) over all vertices of a subject from standard space morphometry data (like 'surf/lh.area.fwhm10.fsaverage.mgh'). You can specify several measures and hemispheres. Uses knowledge about the FreeSurfer directory structure to load the correct files.
#'
#' @param subjects_dir, string. The FreeSurfer SUBJECTS_DIR, i.e., a directory containing the data for all your subjects, each in a subdir named after the subject identifier.
#'
#' @param subjects_list, string vector. A vector of subject identifiers that match the directory names within subjects_dir.
#'
#' @param measures, vector of strings. Names of the vertex-wise morphometry measures. E.g., c("area", "thickness"). Used to construct the names of the morphometry file to be loaded.
#'
#' @param hemis, string, one of 'lh', 'rh' or 'both'. The hemisphere name. Used to construct the names of the annotation and morphometry data files to be loaded.
#'
#' @param fwhm, string. Smoothing as string, e.g. '10' or '25'.
#'
#' @param agg_fun, function. An R function that aggregates data, typically \code{\link{max}}, mean, min or something similar. Note: this is NOT a string, put the function name without quotes. Defaults to mean.
#'
#' @param template_subject, string. Template subject name, defaults to 'fsaverage'.
#'
#' @param format, string. One of 'mgh', 'mgz', 'curv'. Defaults to 'mgh'.
#'
#' @param cast, Whether a separate 'hemi' column should exist.
#'
#' @param cortex_only logical, whether to mask the medial wall, i.e., whether the morphometry data for all vertices which are *not* part of the cortex (as defined by the label file `label/?h.cortex.label`) should be replaced with NA values. In other words, setting this to TRUE will ignore the values of the medial wall between the two hemispheres. If set to true, the mentioned label file needs to exist for the subjects. Also not that the aggregation function will need to be able to cope with NA values if you set this to TRUE. You can use 'agg_fun_extra_params' if needed to achieve that, depending on the function. Foe example, if you use the \code{\link{mean}} function, you could set \code{agg_fun_extra_params=list("na.rm"=TRUE)} to get the mean of the vertices which are not masked. Defaults to FALSE.
#'
#' @param agg_fun_extra_params named list, extra parameters to pass to the aggregation function 'agg_fun' besides the loaded morphometry data. This is useful if you have masked the data and need to ignore NA values in the agg_fun.
#'
#' @return dataframe with aggregated values over all measures and hemis for all subjects, with m columns and n rows, where n is the number of subjects. The m columns are 'subject_id' and '<hemi>.<measure>' (e.g., "lh.thickness") for all combinations of hemi and measure, the latter contains the aggregated data.
#'
#' @family global aggregation functions
#'
#' @export
group.multimorph.agg.standard <- function(subjects_dir, subjects_list, measures, hemis, fwhm, agg_fun = mean, template_subject='fsaverage', format='mgh', cast=TRUE, cortex_only=FALSE, agg_fun_extra_params=NULL) {
  agg_all_measures_and_hemis = data.frame();

  check.subjectslist(subjects_list, subjects_dir=subjects_dir);

  for (hemi in hemis) {
    if(!(hemi %in% c("lh", "rh", "both"))) {
      stop(sprintf("Each entry in the parameter 'hemis' must be one of 'lh', 'rh' or 'both, but the current one is '%s'.\n", hemi));
    }
    for (measure in measures) {
        measure_hemi_data = group.morph.agg.standard(subjects_dir, subjects_list, measure, hemi, fwhm, agg_fun = agg_fun, template_subject=template_subject, format=format, cast=cast, cortex_only=cortex_only, agg_fun_extra_params=agg_fun_extra_params);

        if(nrow(agg_all_measures_and_hemis) == 0) {
          agg_all_measures_and_hemis = measure_hemi_data;
        } else {
          if(cast) {
            agg_all_measures_and_hemis = rbind(agg_all_measures_and_hemis, measure_hemi_data);
          } else {
            agg_all_measures_and_hemis = merge(agg_all_measures_and_hemis, measure_hemi_data, by.x='subject_id', by.y='subject_id');
          }
        }
    }
  }

  return(agg_all_measures_and_hemis);
}




#' @title Aggregate native space morphometry data for multiple measures over hemispheres for a group of subjects.
#'
#' @description Compute the mean (or other aggregates) over all vertices of a subject from native space morphometry data (like 'surf/lh.area'). You can specify several measures and hemispheres. Uses knowledge about the FreeSurfer directory structure to load the correct files.
#'
#' @inheritParams group.multimorph.agg.standard
#'
#' @return dataframe with aggregated values over all measures and hemis for all subjects, with m columns and n rows, where n is the number of subjects. The m columns are 'subject_id' and '<hemi>.<measure>' (e.g., "lh.thickness") for all combinations of hemi and measure, the latter contains the aggregated data.
#'
#' @family global aggregation functions
#'
#' @examples
#' \dontrun{
#'     subjects_dir = fsbrain::get_optional_data_filepath("subjects_dir");
#'     subjects_list = c("subject1", "subject2")
#'     data = group.multimorph.agg.native(subjects_dir, subjects_list, c("thickness", "area"),
#'      c("lh", "rh"), cast=FALSE, cortex_only=TRUE, agg_fun=mean,
#'      agg_fun_extra_params=list("na.rm"=TRUE));
#'     head(data);
#' }
#'
#' @export
group.multimorph.agg.native <- function(subjects_dir, subjects_list, measures, hemis, agg_fun = mean, format='curv', cast=TRUE, cortex_only=FALSE, agg_fun_extra_params=NULL) {
  agg_all_measures_and_hemis = data.frame();

  check.subjectslist(subjects_list, subjects_dir=subjects_dir);

  for (hemi in hemis) {
    if(!(hemi %in% c("lh", "rh", "both"))) {
      stop(sprintf("Each entry in the parameter 'hemis' must be one of 'lh', 'rh' or 'both' but the current one is '%s'.\n", hemi));
    }
    for (measure in measures) {
      measure_hemi_data = group.morph.agg.native(subjects_dir, subjects_list, measure, hemi, agg_fun = agg_fun, format=format, cast=cast, cortex_only=cortex_only, agg_fun_extra_params=agg_fun_extra_params);

      if(nrow(agg_all_measures_and_hemis) == 0) {
        agg_all_measures_and_hemis = measure_hemi_data;
      } else {

        if(cast) {
          agg_all_measures_and_hemis = rbind(agg_all_measures_and_hemis, measure_hemi_data);
        } else {
          agg_all_measures_and_hemis = merge(agg_all_measures_and_hemis, measure_hemi_data, by.x='subject_id', by.y='subject_id');
        }
      }
    }
  }

  return(agg_all_measures_and_hemis);
}
