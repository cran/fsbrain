## ---- eval = FALSE------------------------------------------------------------
#  lh_surf = freesurferformats::read_nisurface('~/data/subject1_spm12/surf/lh.central.subject1.gii');
#  lh_gyrification = freesurferformats::read.fs.curv('~/data/subject1_spm12/surf/lh.gyrification.subject1');
#  vis.data.on.subject('~/data/', 'subject1_spm12', lh_gyrification, NULL, surface=lh_surf);

## ---- eval = FALSE------------------------------------------------------------
#  library('rgl');
#  r3dDefaults$windowRect=c(20, 20, 1800, 1200);

## ---- eval = FALSE------------------------------------------------------------
#  rglo = list('windowRect'=c(20, 20, 1800, 1200));
#  vis.subject.morph.native('~/mysubjects_dir', 'subject1', 'thickness', rgloptions=rglo);

## ---- eval = FALSE------------------------------------------------------------
#  rgla = list('snapshot_png'='~/subject1_thickness.png');
#  vis.subject.morph.native('~/mysubjects_dir', 'subject1', 'thickness', rglactions=rgla);

## ---- eval = FALSE------------------------------------------------------------
#  makecmap_options = list('colFn'=viridis::viridis);
#  vis.subject.morph.native('~/mysubjects_dir', 'subject1', 'thickness', makecmap_options=makecmap_options);

## ---- eval = FALSE------------------------------------------------------------
#  install.packages('viridis');

## ---- eval = FALSE------------------------------------------------------------
#  colFn_many_blues = colorRampPalette(RColorBrewer::brewer.pal(9, name="Blues"));
#  makecmap_options = list('colFn'=colFn_many_blues);
#  vis.subject.morph.native('~/mysubjects_dir', 'subject1', 'thickness', makecmap_options=makecmap_options);

## ---- eval = FALSE------------------------------------------------------------
#  colFn_sequential = viridis::viridis;
#  colFn_qualitative = function(n) { RColorBrewer::brewer.pal(n, name="Set2"); } # n <= 11
#  colFn_diverging = grDevices::colorRampPalette(RColorBrewer::brewer.pal(11, name="RdBu"));

## ---- eval = FALSE------------------------------------------------------------
#  colFn_sequential = function(n) { grDevices::hcl.colors(n, palette = "viridis"); }
#  colFn_qualitative = function(n) { grDevices::hcl.colors(n, palette = "Dark 3"); }
#  colFn_diverging = function(n) { grDevices::hcl.colors(n, palette = "Blue-Red 3"); }

## ---- eval = FALSE------------------------------------------------------------
#  colFn_sequential_heat = function(n) { grDevices::hcl.colors(n, "YlOrRd"); }

## ---- eval = FALSE------------------------------------------------------------
#  makecmap_options = list('colFn'=colFn_diverging, 'symm'=TRUE);

## ---- eval = FALSE------------------------------------------------------------
#  mkc = list('n'=200L);
#  vis.subject.morph.native('~/mysubjects_dir', 'subject1', 'thickness', makecmap_options=mkc);

## ---- eval = FALSE------------------------------------------------------------
#  # To get coloredmeshes return value only, ignore the visualization:
#  cm = vis.subject.morph.native(sjd, sj, 'thickness', makecmap_options = list('n'=200), cortex_only = T);
#  # Produce high quality tight layout:
#  vislayout.from.coloredmeshes(cm);

## ---- eval = FALSE------------------------------------------------------------
#  output_brain_img = "fsbrain_arranged.png";
#  vislayout.from.coloredmeshes(cm, view_angles = get.view.angle.names(angle_set='t9'), output_img = output_brain_img);

## ---- eval = FALSE------------------------------------------------------------
#  output_cbar_img = "fsbrain_cbar.png";
#  output_final_img = "fsbrain_merged.png";
#  coloredmesh.plot.colorbar.separate(cm, image.plot_extra_options = list('horizontal' = TRUE), png_options = list('filename'=output_cbar_img, 'width'=1800));
#  combine.colorbar.with.brainview.image(output_brain_img, output_cbar_img, output_final_img);

## ---- eval = FALSE------------------------------------------------------------
#  vis.subject.morph.native(sjd, sj, 'thickness', rglactions = list('shift_hemis_apart'=TRUE), surface='inflated', views='si');

## ---- eval = FALSE------------------------------------------------------------
#  vis.subject.morph.native(sjd, sj, 'thickness', rglactions = list('shift_hemis_apart'=list('min_dist'=20)), surface='inflated', views='si');

## ---- eval = FALSE------------------------------------------------------------
#  vis.fs.surface('~/Documents/my_mesh.ply');

## ---- eval = FALSE------------------------------------------------------------
#  Error in par(new = TRUE, pty = "m", plt = smallplot, err = -1) :
#    invalid value specified for graphical parameter "plt"

## ---- eval = FALSE------------------------------------------------------------
#  vis.subject.morph.native(sjd, sj, 'your_measure_here')
#  Error in squash::cmap(lh_morph_data, map = common_cmap) :
#    Found 2193 values outside map range.

## ---- eval = FALSE------------------------------------------------------------
#  vis.subject.morph.native(sjd, sj, 'your_measure_here', cortex_only = T)

## ---- eval = FALSE------------------------------------------------------------
#  Warning messages:
#  1: In rgl.init(initValue, onlyNULL) : RGL: unable to open X11 display
#  2: 'rgl.init' failed, running with 'rgl.useNULL = TRUE'.

