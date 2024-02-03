## ---- eval = FALSE------------------------------------------------------------
#  library("fsbrain");
#  fsbrain::download_optional_data();
#  subjects_dir = fsbrain::get_optional_data_filepath("subjects_dir");
#  subject_id = 'subject1';       # for function which use one subject only

## ---- eval = FALSE------------------------------------------------------------
#  brain_data = subject.volume(subjects_dir, subject_id, "brain");

## ---- eval = FALSE------------------------------------------------------------
#  brain = subject.volume(subjects_dir, subject_id, "brain", with_header = TRUE);
#  brain_data = brain$data;

## ---- eval = FALSE------------------------------------------------------------
#  brain = subject.volume(subjects_dir, subject_id, 'brain') / 255;
#  bounded_brain = vol.boundary.box(brain, apply=TRUE);
#  volvis.lightbox(bounded_brain);

## ---- eval = FALSE------------------------------------------------------------
#  volvis.lb("~/data/study1/subject1/mri/brain.mgz");
#  volvis.lb("~/data/study1/subject1/mri/brain.mgz", bbox_threshold = 1L);
#  volvis.lb("~/data/study1/subject1/mri/brain.mgz", background = "~/data/study1/subject1/mri/T1.mgz");
#  volvis.lb("~/data/study1/subject1/mri/brain.mgz", background = "#FEFEFE", background_color="#FEFEFE");

## ---- eval = FALSE------------------------------------------------------------
#  volume = subject.volume(subjects_dir, subject_id, 'brain');
#  background = subject.volume(subjects_dir, subject_id, 'T1'); # if you have this file.
#  volvis.lb(volume);
#  volvis.lb(volume, background = background);

## ---- eval = FALSE------------------------------------------------------------
#  ct = file.path(find.freesurferhome(mustWork = T), "FreeSurferColorLUT.txt"); # ct = "color table"
#  volvis.lb("~/data/study1/subject1/mri/aseg.mgz", background = "~/data/study1/subject1/mri/T1.mgz", colortable = ct, colFn=NULL, axis=2L);
#  volvis.lb("~/data/study1/subject1/mri/aseg.mgz", background = "~/data/study1/subject1/mri/T1.mgz", colortable = ct, colFn=NULL, axis=1L, bbox_threshold = 0);

## ---- eval = FALSE------------------------------------------------------------
#  brain = subject.volume(subjects_dir, subject_id, 'brain');
#  threshold = 5L;
#  brain[which(brain <= threshold, arr.ind = TRUE)] = NA;  # mark background
#  brain = vol.hull(brain, thickness = 2L);  # Remove inner triangles for performance, optional.
#  volvis.voxels(brain);

