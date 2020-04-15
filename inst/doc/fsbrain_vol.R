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
#  brain = subject.volume(subjects_dir, subject_id, 'brain');
#  threshold = 1L;
#  brain[which(brain <= threshold, arr.ind = TRUE)] = NA;  # mark background
#  brain_hull = vol.hull(brain); # remove inner triangles
#  volvis.voxels(brain_hull);

