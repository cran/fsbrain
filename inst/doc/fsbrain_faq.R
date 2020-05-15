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
#  mkc = list('colFn'=viridis::viridis);
#  vis.subject.morph.native('~/mysubjects_dir', 'subject1', 'thickness', makecmap_options=mkc);

## ---- eval = FALSE------------------------------------------------------------
#  install.packages('viridis');

## ---- eval = FALSE------------------------------------------------------------
#  colFn_many_blues = colorRampPalette(RColorBrewer::brewer.pal(9, name="Blues"));
#  mkc = list('colFn'=colFn_many_blues);
#  vis.subject.morph.native('~/mysubjects_dir', 'subject1', 'thickness', makecmap_options=mkc);

## ---- eval = FALSE------------------------------------------------------------
#  mkc = list('n'=100L);
#  vis.subject.morph.native('~/mysubjects_dir', 'subject1', 'thickness', makecmap_options=mkc);

## ---- eval = FALSE------------------------------------------------------------
#  # To get coloredmeshes return value only, ignore the visualization:
#  cm = vis.subject.morph.native(sjd, sj, 'thickness', makecmap_options = list('n'=100), cortex_only = T);
#  # Produce high quality tight layout:
#  vislayout.from.coloredmeshes(cm);

## ---- eval = FALSE------------------------------------------------------------
#  output_brain_img = "~/fig1_brain.png";
#  vislayout.from.coloredmeshes(cm, view_angles = get.view.angle.names(angle_set='t9'), output_img = output_brain_img);

## ---- eval = FALSE------------------------------------------------------------
#  output_cbar_img = "~/fig1_colorbar.png";
#  output_final_img = "~/fig1.png";
#  coloredmesh.plot.colorbar.separate(cm, image.plot_extra_options = list('horizontal' = TRUE), png_options = list('filename'=output_cbar_img, 'width'=1800));
#  combine.colorbar.with.brainview.image(output_brain_img, output_cbar_img, output_final_img);

