## ---- eval = FALSE-------------------------------------------------------
#  library("fsbrain");
#  fsbrain::download_optional_data();
#  subjects_dir = fsbrain::get_optional_data_filepath("subjects_dir");
#  subjects_list = c("subject1", "subject2");
#  subject_id = 'subject1';       # for function which use one subject only

## ---- eval = FALSE-------------------------------------------------------
#  groupdata_nat = group.morph.native(subjects_dir, subjects_list, "thickness", "lh");

## ---- eval = FALSE-------------------------------------------------------
#  subject_id = 'subject1';
#  cat(sprintf("Subject '%s' has %d vertices and the mean cortical thickness of the left hemi is %f.\n", subject_id, length(groupdata_nat[[subject_id]]), mean(groupdata_nat[[subject_id]])));
#  # Output: Subject 'subject1' has 149244 vertices and the mean cortical thickness of the left hemi is 2.437466.

## ---- eval = FALSE-------------------------------------------------------
#  groupdata_std = group.morph.standard(subjects_dir, subjects_list, "thickness", "lh", fwhm="10");

## ---- eval = FALSE-------------------------------------------------------
#  cat(sprintf("Data length is %d for subject1, %d for subject2.\n", length(groupdata_std$subject1), length(groupdata_std$subject2)));
#  # output: Data length is 163842 for subject1, 163842 for subject2.

## ---- eval = FALSE-------------------------------------------------------
#  grouplabels = group.label(subjects_dir, subjects_list, "cortex.label", hemi='lh');
#  cat(sprintf("The left hemisphere cortex label of subject1 includes %d vertices.\n", length(grouplabels$subject1)));
#  # output: The left hemisphere cortex label of subject1 includes 140891 vertices.

## ---- eval = FALSE-------------------------------------------------------
#  surface = 'white';
#  hemi = 'both';
#  atlas = 'aparc';
#  region = 'bankssts';
#  
#  # Create a mask from a region of an annotation:
#  lh_annot = subject.annot(subjects_dir, subject_id, 'lh', atlas);
#  rh_annot = subject.annot(subjects_dir, subject_id, 'rh', atlas);
#  lh_label = label.from.annotdata(lh_annot, region);
#  rh_label = label.from.annotdata(rh_annot, region);
#  lh_mask = mask.from.labeldata.for.hemi(lh_label, length(lh_annot$vertices));
#  rh_mask = mask.from.labeldata.for.hemi(rh_label, length(rh_annot$vertices));
#  
#  # Edit the mask: add the vertices from another region to it:
#  region2 = 'medialorbitofrontal';
#  lh_label2 = label.from.annotdata(lh_annot, region2);
#  rh_label2 = label.from.annotdata(rh_annot, region2);
#  lh_mask2 = mask.from.labeldata.for.hemi(lh_label2, length(lh_annot$vertices),
#    existing_mask = lh_mask);
#  rh_mask2 = mask.from.labeldata.for.hemi(rh_label2, length(rh_annot$vertices),
#    existing_mask = rh_mask);

## ---- eval = FALSE-------------------------------------------------------
#  groupannot = group.annot(subjects_dir, subjects_list, 'lh', 'aparc');
#  cat(sprintf("The left hemi of subject2 has %d vertices, and vertex 10 is in region '%s'.\n", length(groupannot$subject2$vertices), groupannot$subject2$label_names[10]));
#  # output: The left hemi of subject2 has 149244 vertices, and vertex 10 is in region 'lateraloccipital'.

## ---- eval = FALSE-------------------------------------------------------
#  mean_thickness_lh_native = group.morph.agg.native(subjects_dir, subjects_list, "thickness", "lh", agg_fun=mean);
#  mean_thickness_lh_native;
#  # output:
#  #  subject_id hemi measure_name measure_value
#  #1   subject1   lh    thickness      2.437466
#  #2   subject2   lh    thickness      2.437466

## ---- eval = FALSE-------------------------------------------------------
#  mean_thickness_lh_std = group.morph.agg.standard(subjects_dir, subjects_list, "thickness", "lh", fwhm="10", agg_fun=mean);
#  mean_thickness_lh_std;
#  # output:
#    subject_id hemi measure_name measure_value
#  1   subject1   lh    thickness       2.32443
#  2   subject2   lh    thickness       2.32443

## ---- eval = FALSE-------------------------------------------------------
#  agg_nat = group.multimorph.agg.native(subjects_dir, subjects_list, c("thickness", "area"), c("lh", "rh"), agg_fun = mean);
#  head(agg_nat);
#  # output:
#  #  subject_id hemi measure_name measure_value
#  #1   subject1   lh    thickness     2.4374657
#  #2   subject2   lh    thickness     2.4374657
#  #3   subject1   lh         area     0.6690556
#  #4   subject2   lh         area     0.6690556
#  #5   subject1   rh    thickness     2.4143047
#  #6   subject2   rh    thickness     2.4143047

## ---- eval = FALSE-------------------------------------------------------
#  agg_nat2 = group.multimorph.agg.native(subjects_dir, subjects_list, c("thickness", "area"), c("lh", "rh"), agg_fun = mean, cast=FALSE);
#  head(agg_nat2);
#  # output:
#  # subject_id lh.thickness   lh.area rh.thickness   rh.area
#  #1   subject1     2.437466 0.6690556     2.414305 0.6607554
#  #2   subject2     2.437466 0.6690556     2.414305 0.6607554

## ---- eval = FALSE-------------------------------------------------------
#  data_std = group.multimorph.agg.standard(subjects_dir, subjects_list, c("thickness", "area"), c("lh", "rh"), fwhm='10', agg_fun = mean);
#  head(data_std);
#  # output:
#  #  subject_id hemi measure_name measure_value
#  #1   subject1   lh    thickness     2.3244303
#  #2   subject2   lh    thickness     2.3244303
#  #3   subject1   lh         area     0.5699257
#  #4   subject2   lh         area     0.5699257
#  #5   subject1   rh    thickness     2.2926377
#  #6   subject2   rh    thickness     2.2926377

## ---- eval = FALSE-------------------------------------------------------
#  atlas = 'aparc';         # or 'aparc.a2009s', or 'aparc.DKTatlas'.
#  measure = 'thickness';
#  region_means_native = group.agg.atlas.native(subjects_dir, subjects_list, measure, "lh", atlas, agg_fun = mean);
#  head(region_means_native[,1:6]);
#  # output:
#  #          subject bankssts caudalanteriorcingulate caudalmiddlefrontal   cuneus entorhinal
#  #subject1 subject1 2.485596                 2.70373            2.591197 1.986978   3.702725
#  #subject2 subject2 2.485596                 2.70373            2.591197 1.986978   3.702725

## ---- eval = FALSE-------------------------------------------------------
#  region_means_std = group.agg.atlas.standard(subjects_dir, subjects_list, measure, "lh", atlas, fwhm = '10', agg_fun = mean);
#  head(region_means_std[1:5]);
#  # output:
#  #          subject bankssts caudalanteriorcingulate caudalmiddlefrontal   cuneus
#  #subject1 subject1 2.583408                2.780666            2.594696 2.018783
#  #subject2 subject2 2.583408                2.780666            2.594696 2.018783

## ---- eval = FALSE-------------------------------------------------------
#  surface = 'white';
#  hemi = 'both';
#  atlas = 'aparc';
#  region = 'bankssts';
#  
#  # Create a label from a region of an annotation or atlas:
#  lh_annot = subject.annot(subjects_dir, subject_id, 'lh', atlas);
#  rh_annot = subject.annot(subjects_dir, subject_id, 'rh', atlas);
#  lh_label = label.from.annotdata(lh_annot, region);
#  rh_label = label.from.annotdata(rh_annot, region);

## ---- eval = FALSE-------------------------------------------------------
#  hemi = "lh"               # 'lh' or 'rh'
#  atlas = "aparc"           # an atlas, e.g., 'aparc', 'aparc.a2009s', 'aparc.DKTatlas'
#  
#  # Some directory where we can find fsaverage. This can be omitted if FREESURFER_HOME or SUBJECTS_DIR is set, the function will find fsaverage in there by default. Also see the function download_fsaverage().
#  template_subjects_dir = "~/software/freesurfer/subjects";
#  
#  region_value_list = list("bankssts"=0.9, "precuneus"=0.7, "postcentral"=0.8, "lingual"=0.6);
#  
#  ret = fsbrain::write.region.values.fsaverage(hemi, atlas, region_value_list, output_file="/tmp/lh_spread.mgz", template_subjects_dir=template_subjects_dir, show_freeview_tip=TRUE);
#  # output:
#  # To visualize these region values, try:
#  #  freeview -f ${FREESURFER_HOME}/subjects/fsaverage/surf/lh.white:overlay=/tmp/lh_spread.mgz:overlay_method=linearopaque:overlay_threshold=0,100,percentile

## ---- eval = FALSE-------------------------------------------------------
#  vis.subject.annot(subjects_dir, 'subject1', 'aparc', 'both', views=c('si'));

## ---- eval = FALSE-------------------------------------------------------
#  vis.subject.morph.native(subjects_dir, 'subject', 'thickness', hemi='both', views=c('si'))

## ---- eval = FALSE-------------------------------------------------------
#  morph_data_lh = subject.morph.native(subjects_dir, 'subject1', 'thickness', 'lh');
#  morph_data_rh = subject.morph.native(subjects_dir, 'subject1', 'thickness', 'rh');
#  # Do something with the morph_data here.
#  vis.data.on.subject(subjects_dir, 'subject1', morph_data_lh, morph_data_rh, views=c('si'));

## ---- eval = FALSE-------------------------------------------------------
#  surface = 'white';
#  hemi = 'both';
#  label = 'cortex.label';
#  vis.subject.label(subjects_dir, subject_id, label, hemi);

## ---- eval = FALSE-------------------------------------------------------
#  surface = 'white';
#  hemi = 'both';
#  atlas = 'aparc';
#  region = 'bankssts';
#  
#  # Create a mask from a region of an annotation:
#  lh_annot = subject.annot(subjects_dir, subject_id, 'lh', atlas);
#  rh_annot = subject.annot(subjects_dir, subject_id, 'rh', atlas);
#  lh_label = label.from.annotdata(lh_annot, region);
#  rh_label = label.from.annotdata(rh_annot, region);
#  lh_mask = mask.from.labeldata.for.hemi(lh_label, length(lh_annot$vertices));
#  rh_mask = mask.from.labeldata.for.hemi(rh_label, length(rh_annot$vertices));
#  
#  # visualize it
#  vis.mask.on.subject(subjects_dir, subject_id, lh_mask, rh_mask);

## ---- eval = FALSE-------------------------------------------------------
#  atlas = 'aparc';
#  template_subject = 'fsaverage';
#  # Some directory where we can find the template_subject. This can be omitted if FREESURFER_HOME or SUBJECTS_DIR is set and the template subject is in one of them. In that case, the function will find fsaverage in there by default. Also see the function download_fsaverage().
#  template_subjects_dir = "~/software/freesurfer/subjects";    # adapt to your machine
#  
#  
#  # For the left hemi, we manually set data values for some regions.
#  lh_region_value_list = list("bankssts"=0.9, "precuneus"=0.7, "postcentral"=0.8, "lingual"=0.6);
#  
#  # For the right hemisphere, we do something a little bit more complex: first get all atlas region names:
#  atlas_region_names = get.atlas.region.names(atlas, template_subjects_dir=template_subjects_dir, template_subject=template_subject);
#  # As mentioned above, if you have fsaverage in your SUBJECTS_DIR or FREESURFER_HOME is set, you could replace the last line with:
#  #atlas_region_names = get.atlas.region.names(atlas);
#  
#  # OK, now that we can check all region names. We will now assign a random value to each region:
#  rh_region_value_list = rnorm(length(atlas_region_names), 3.0, 1.0);         # create 36 random values with mean 3 and stddev 1
#  names(rh_region_value_list) = atlas_region_names;                           # use the region names we retrieved earlier
#  
#  # Now we have region_value_lists for both hemispheres. Time to visualize them:
#  vis.region.values.on.subject(template_subjects_dir, template_subject, atlas, lh_region_value_list, rh_region_value_list);

## ---- eval = FALSE-------------------------------------------------------
#  vis.subject.morph.native(subjects_dir, 'subject', 'thickness', hemi='both', views=c('t4', 't9'))

## ---- eval = FALSE-------------------------------------------------------
#  vis.subject.morph.native(subjects_dir, 'subject', 'thickness', hemi='both', views=c('si'), surface='inflated')

## ---- eval = FALSE-------------------------------------------------------
#  rgloptions = list("windowRect"=c(50, 50, 1000, 1000));
#  vis.subject.morph.native(subjects_dir, 'subject', 'thickness', hemi='both', views=c('si'), rgloptions=rgloptions)

## ---- eval = FALSE-------------------------------------------------------
#  subjects_dir = fsbrain::get_optional_data_filepath("subjects_dir");
#  subject_id = 'subject1';
#  rgloptions=list("windowRect"=c(50, 50, 600, 600));     # the first 2 entries give the position on screen, the rest defines resolution as width, height in px
#  surface = 'white';
#  measure = 'thickness';
#  movie_base_filename = sprintf("fsbrain_%s_%s_%s", subject_id, measure, surface);
#  rglactions = list("movie"=movie_base_filename, "clip_data"=c(0.05, 0.95));
#  # Creating a movie requires the rotating view ('sr' for 'single rotating'). The action will be silently ignored in all other views.
#  vis.subject.morph.native(subjects_dir, subject_id, measure, 'both', views=c('sr'), rgloptions=rgloptions, rglactions=rglactions);

