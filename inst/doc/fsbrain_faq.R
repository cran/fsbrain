## ---- eval = FALSE------------------------------------------------------------
#  lh_surf = freesurferformats::read_nisurface('~/data/subject1_spm12/surf/lh.central.subject1.gii');
#  lh_gyrification = freesurferformats::read.fs.curv('~/data/subject1_spm12/surf/lh.gyrification.subject1');
#  vis.data.on.subject('~/data/', 'subject1_spm12', lh_gyrification, NULL, surface=lh_surf);

## ---- eval = FALSE------------------------------------------------------------
#  # read file with bssr package
#  bd = bssr::readdfs('~/data/brainsuite_subject1/subject1_v1_sMRI.brain.dfs');
#  
#  # turn into fs.surface
#  sfb = list('vertices'=t(bd$vertices), faces=t(bd$faces)+1L);
#  class(sfb) = c(class(sfb), 'fs.surface');
#  
#  # show it with fsbrain
#  fsbrain::vis.fs.surface(sfb);

## ---- eval = FALSE------------------------------------------------------------
#  # load and turn into fs.surface
#  bd_thickness = bssr::readdfs('~/data/brainsuite_subject1/subject1_v1_sMRI.pvc-thickness_0-6mm.right.mid.cortex.dfs');
#  sfb_thickness = list('vertices'=t(bd_thickness$vertices), faces=t(bd_thickness$faces)+1L);
#  class(sfb_thickness) = c(class(sfb_thickness), 'fs.surface');
#  
#  # Display the vertex colors:
#  fsbrain::vis.fs.surface(sfb_thickness, col=rgb(t(bd_thickness$vColor)));
#  
#  # Display labels (feel free to change the colormap).
#  fsbrain::vis.fs.surface(sfb_thickness, per_vertex_data = bd_thickness$labels);
#  
#  # Display raw morphometry data (feel free to change the colormap).
#  fsbrain::vis.fs.surface(sfb_thickness, per_vertex_data = bd_thickness$attributes);

## ---- eval = FALSE------------------------------------------------------------
#  fsbrain.set.default.figsize(1200, 1200);

## ---- eval = FALSE------------------------------------------------------------
#  rgloptions = list('windowRect'=c(20, 20, 1800, 1200));
#  vis.subject.morph.native('~/mysubjects_dir', 'subject1', 'thickness', rgloptions=rgloptions);

## ---- eval = FALSE------------------------------------------------------------
#  rgla = list('snapshot_png'='~/subject1_thickness.png');
#  vis.subject.morph.native('~/mysubjects_dir', 'subject1', 'thickness', rglactions=rgla);

## ---- eval = FALSE------------------------------------------------------------
#  rgla = list('trans_fun'=clip.data);
#  vis.subject.morph.native('~/mysubjects_dir', 'subject1', 'curv', rglactions=rgla);

## ---- eval = FALSE------------------------------------------------------------
#  rgla = list('trans_fun'=limit_fun(2,3));
#  vis.subject.morph.native('~/mysubjects_dir', 'subject1', 'thickness', rglactions = rgla);

## ---- eval = FALSE------------------------------------------------------------
#  makecmap_options = list('range'=c(0,6));
#  vis.subject.morph.native('~/mysubjects_dir', 'subject1', 'thickness', makecmap_options = makecmap_options);

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
#  mkc = list('n'=200L, 'col.na'='orange');
#  vis.subject.morph.native('~/mysubjects_dir', 'subject1', 'thickness', cortex_only = TRUE, makecmap_options=mkc);

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
#  subjects_dir = fsbrain::get_optional_data_filepath("subjects_dir");
#  
#  view_angles = get.view.angle.names(angle_set = "t4");
#  
#  coloredmeshes = vis.subject.morph.native(subjects_dir, "subject1", "thickness", views=NULL);
#  vislayout.from.coloredmeshes(coloredmeshes, view_angles = view_angles, grid_like=FALSE, output_img="~/fsbrain_horizontal.png");

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

## ---- eval = FALSE------------------------------------------------------------
#  library("fsbrain")
#  Error: package or namespace load failed for ‘fsbrain’ in get(method, envir = home):
#  lazy-load database '/Users/youruser/Library/R/3.6/library/fsbrain/R/fsbrain.rdb' is corrupt

