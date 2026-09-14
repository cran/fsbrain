## ----eval=FALSE---------------------------------------------------------------
# install.packages("scimesh");

## ----eval=FALSE---------------------------------------------------------------
# # Switch to the scimesh software renderer for headless environments:
# options(fsbrain.renderer_backend = "scimesh");
# 
# # Check the current backend:
# get.fsbrain.renderer.backend();

## ----eval=FALSE---------------------------------------------------------------
# options(fsbrain.scimesh.output_dims = c(1600, 900));

## ----eval=FALSE---------------------------------------------------------------
# options(fsbrain.renderer_backend = "rgl");

## ----eval=FALSE---------------------------------------------------------------
# library('fsbrain');
# 
# download_optional_data();
# download_fsaverage(accept_freesurfer_license = TRUE);
# 
# sjd = get_optional_data_filepath("subjects_dir");
# sj = 'subject1';

## ----eval=FALSE---------------------------------------------------------------
# cm = vis.subject.morph.standard(sjd, sj, 'thickness', fwhm='10', cortex_only=TRUE, views=NULL);
# img = export(cm, colorbar_legend='Cortical thickness [mm]', output_img='thickness_t4.png');

## ----eval=FALSE---------------------------------------------------------------
# cm = vis.subject.annot(sjd, sj, 'aparc', views=NULL);
# img = export(cm, view_angles = c("sd_medial_lh", "sd_medial_rh"));

## ----eval=FALSE---------------------------------------------------------------
# cm = vis.subject.morph.native(sjd, sj, 'curv', cortex_only=TRUE, views=NULL, rglactions=list('trans_fun'=clip.data));
# img = export(cm, view_angles = get.view.angle.names(angle_set = "t8"), colorbar_legend='Mean curvature [mm^-1]');

## ----eval=FALSE---------------------------------------------------------------
# cm = vis.subject.morph.standard(sjd, sj, 'sulc', fwhm='10', cortex_only=TRUE, views=NULL);
# img = export(cm, view_angles = get.view.angle.names("t4"), grid_like = FALSE, colorbar_legend='Sulcal depth [mm]');

## ----eval=FALSE---------------------------------------------------------------
# cm = vis.subject.morph.standard(sjd, sj, 'sulc', fwhm='10', cortex_only=TRUE, views=NULL);
# img = export(cm, colorbar_legend='Sulcal depth [mm]', draw_colorbar = 'vertical');

## ----eval=FALSE---------------------------------------------------------------
# cm = vis.subject.morph.standard(sjd, sj, 'sulc', fwhm='10', cortex_only=TRUE, views=NULL);
# img = export(cm, view_angles = c("sd_medial_lh", "sd_medial_rh"), background_color = '#000000', draw_colorbar = FALSE);

## ----eval=FALSE---------------------------------------------------------------
# cm = vis.subject.morph.standard(sjd, sj, 'sulc', fwhm='10', cortex_only=TRUE, views=NULL);
# img = export(cm, view_angles = c("sd_medial_lh", "sd_medial_rh"), transparency_color = '#FFFFFF');

## ----eval=FALSE---------------------------------------------------------------
# atlas = 'aparc';   # Desikan atlas
# 
# # For the left hemisphere, we just assign a subset of the atlas regions.
# # The others will get the default value.
# lh_region_value_list = list("bankssts"=0.9, "precuneus"=0.7, "postcentral"=0.8, "lingual"=0.6);
# 
# # For the right hemisphere, we retrieve the full list of regions for the
# # atlas and assign random values to all of them.
# atlas_region_names = get.atlas.region.names(atlas, template_subjects_dir = sjd, template_subject = sj);
# rh_region_value_list = rnorm(length(atlas_region_names), 0.8, 0.2);
# names(rh_region_value_list) = atlas_region_names;
# 
# cm = vis.region.values.on.subject(sjd, sj, atlas, lh_region_value_list, rh_region_value_list, views=NULL);
# img = export(cm, colorbar_legend='Effect size (simulated data)');

## ----eval=FALSE---------------------------------------------------------------
# subjects_dir = get_optional_data_filepath("subjects_dir");
# subject_id = 'fsaverage';
# 
# lh_demo_cluster_file = system.file("extdata", "lh.clusters_fsaverage.mgz", package = "fsbrain", mustWork = TRUE);
# rh_demo_cluster_file = system.file("extdata", "rh.clusters_fsaverage.mgz", package = "fsbrain", mustWork = TRUE);
# 
# lh_clust = freesurferformats::read.fs.morph(lh_demo_cluster_file);   # a single positive cluster (activation), the other values are 0
# rh_clust = freesurferformats::read.fs.morph(rh_demo_cluster_file);   # two negative clusters
# 
# cm = vis.symmetric.data.on.subject(subjects_dir, subject_id, lh_clust, rh_clust, bg="curv_light", views=NULL);
# img = export(cm, colorbar_legend='t-value (simulated data)');

## ----eval=FALSE---------------------------------------------------------------
# # 1. Paths to the mesh and data files (arbitrary locations, no subjects_dir needed):
# lh_surf_file = get_optional_data_filepath(file.path("subjects_dir", "subject1", "surf", "lh.white"));
# rh_surf_file = get_optional_data_filepath(file.path("subjects_dir", "subject1", "surf", "rh.white"));
# lh_thick_file = get_optional_data_filepath(file.path("subjects_dir", "subject1", "surf", "lh.thickness"));
# rh_thick_file = get_optional_data_filepath(file.path("subjects_dir", "subject1", "surf", "rh.thickness"));
# 
# # 2. Load the meshes and the per-vertex data:
# lh_surf = freesurferformats::read.fs.surface(lh_surf_file);
# rh_surf = freesurferformats::read.fs.surface(rh_surf_file);
# lh_thick = freesurferformats::read.fs.morph(lh_thick_file);
# rh_thick = freesurferformats::read.fs.morph(rh_thick_file);
# 
# # 3. Build coloredmeshes from the preloaded data and export a multi-view figure:
# cm_lh = coloredmesh.from.preloaded.data(lh_surf, morph_data = lh_thick, hemi = "lh");
# cm_rh = coloredmesh.from.preloaded.data(rh_surf, morph_data = rh_thick, hemi = "rh");
# 
# img = export(list("lh" = cm_lh, "rh" = cm_rh), colorbar_legend = 'Cortical thickness [mm]', output_img = 'manual_thickness_t4.png');

