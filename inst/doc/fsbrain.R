## ---- eval = FALSE-------------------------------------------------------
#  library("fsbrain");
#  fsbrain::download_optional_data();
#  subjects_dir = fsbrain::get_optional_data_filepath("subjects_dir");
#  subjects_list = c("subject1", "subject2");

## ---- eval = FALSE-------------------------------------------------------
#  mean_thickness_lh_native = group.morph.agg.native(subjects_dir, subjects_list, "thickness", "lh", agg_fun=mean);
#  mean_thickness_lh_native;

## ---- eval = FALSE-------------------------------------------------------
#  mean_thickness_lh_std = group.morph.agg.standard(subjects_dir, subjects_list, "thickness", "lh", fwhm="10", agg_fun=mean);
#  mean_thickness_lh_std;

## ---- eval = FALSE-------------------------------------------------------
#  agg_nat = group.multimorph.agg.native(subjects_dir, subjects_list, c("thickness", "area"), c("lh", "rh"), agg_fun = mean);
#  head(agg_nat);

## ---- eval = FALSE-------------------------------------------------------
#  data_std = group.multimorph.agg.standard(subjects_dir, subjects_list, c("thickness", "area"), c("lh", "rh"), fwhm='10', agg_fun = mean);
#  head(data_std);

## ---- eval = FALSE-------------------------------------------------------
#  atlas = 'aparc';         # or 'aparc.a2009s', or 'aparc.DKTatlas'.
#  measure = 'thickness';
#  region_means_native = group.agg.atlas.native(subjects_dir, subjects_list, measure, "lh", atlas, agg_fun = mean);
#  head(region_means_native);

## ---- eval = FALSE-------------------------------------------------------
#  region_means_std = group.agg.atlas.standard(subjects_dir, subjects_list, measure, "lh", atlas, fwhm = '10', agg_fun = mean);

## ---- eval = FALSE-------------------------------------------------------
#  hemi = "lh"               # 'lh' or 'rh'
#  atlas = "aparc"           # an atlas, e.g., 'aparc', 'aparc.a2009s', 'aparc.DKTatlas'
#  
#  template_subjects_dir = "~/software/freesurfer/subjects";    # Some directory where we can find fsaverage. This can be omitted if FREESURFER_HOME is set, the function will find fsaverage in there by default.
#  
#  # One can also retrieve all region names of an atlas. This would get all 36 aparc regions:
#  region_names_aparc = fsbrain::get.atlas.region.names('aparc', template_subjects_dir=template_subjects_dir);
#  region_value_list = as.list(rnorm(length(region_names_aparc), mean=5, sd=1.5)); # assign some random normal values for this example. One would put effect size values or whatever here. The order of values has to match the order of the region names.
#  names(region_value_list) = region_names_aparc;    # Assign the names to the values.
#  
#  ret = fsbrain::write.region.values.fsaverage(hemi, atlas, region_value_list, output_file="/tmp/spread.mgz", template_subjects_dir=template_subjects_dir, show_freeview_tip=TRUE);

## ---- eval = FALSE-------------------------------------------------------
#  vis.subject.annot(subjects_dir, 'subject1', 'aparc', 'both');

## ---- eval = FALSE-------------------------------------------------------
#  morph_data_lh = subject.morph.native(subjects_dir, 'subject1', 'thickness', 'lh');
#  morph_data_rh = subject.morph.native(subjects_dir, 'subject1', 'thickness', 'rh');
#  vis.data.on.subject(subjects_dir, 'subject1', morph_data_lh, morph_data_rh);

