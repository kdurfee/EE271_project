setenv reports_dirc_verif_mayank reports_optimization_2


setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:$PWD
ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so.8.0.2 libjpeg.so.62
ln -s /usr/lib/x86_64-linux-gnu/libtiff.so.5.2.0 libtiff.so.3

echo "Creating dir - $reports_dirc_verif_mayank"

mkdir $reports_dirc_verif_mayank
make run RUN="+testname=/usr/class/ee271/project/vect/vec_271_00_sv.dat"
mv sv_out.ppm $reports_dirc_verif_mayank/sv_out_vec_271_00_sv.ppm
mv run_bb.log $reports_dirc_verif_mayank/run_bb_00_sv.log 
make run RUN="+testname=/usr/class/ee271/project/vect/vec_271_01_sv.dat"
mv sv_out.ppm $reports_dirc_verif_mayank/sv_out_vec_271_01_sv.ppm
mv run_bb.log $reports_dirc_verif_mayank/run_bb_01_sv.log 
make run RUN="+testname=/usr/class/ee271/project/vect/vec_271_01_sv_short.dat"
mv sv_out.ppm $reports_dirc_verif_mayank/sv_out_vec_271_01_sv_short.ppm
mv run_bb.log $reports_dirc_verif_mayank/run_bb_01_sv_short.log 
make run RUN="+testname=/usr/class/ee271/project/vect/vec_271_02_sv.dat"
mv sv_out.ppm $reports_dirc_verif_mayank/sv_out_vec_271_02_sv.ppm
mv run_bb.log $reports_dirc_verif_mayank/run_bb_02_sv.log 
make run RUN="+testname=/usr/class/ee271/project/vect/vec_271_02_sv_short.dat"
mv sv_out.ppm $reports_dirc_verif_mayank/sv_out_vec_271_02_sv_short.ppm
mv run_bb.log $reports_dirc_verif_mayank/run_bb_02_sv_short.log 
make run RUN="+testname=/usr/class/ee271/project/vect/vec_271_03_sv_short.dat"
mv sv_out.ppm $reports_dirc_verif_mayank/sv_out_vec_271_03_sv_short.ppm
mv run_bb.log $reports_dirc_verif_mayank/run_bb_03_sv_short.log 
make run RUN="+testname=/usr/class/ee271/project/vect/vec_271_04_sv.dat"
mv sv_out.ppm $reports_dirc_verif_mayank/sv_out_vec_271_04_sv.ppm
mv run_bb.log $reports_dirc_verif_mayank/run_bb_04_sv.log 

cd $reports_dirc_verif_mayank
setenv REF_FILE_PPM 00_sv
diff sv_out_vec_271_${REF_FILE_PPM}.ppm /usr/class/ee271/project/vect/vec_271_${REF_FILE_PPM}_ref.ppm > Diff_result_verif.rpt
setenv REF_FILE_PPM 01_sv
diff sv_out_vec_271_${REF_FILE_PPM}.ppm /usr/class/ee271/project/vect/vec_271_${REF_FILE_PPM}_ref.ppm >> Diff_result_verif.rpt
setenv REF_FILE_PPM 01_sv_short
diff sv_out_vec_271_${REF_FILE_PPM}.ppm /usr/class/ee271/project/vect/vec_271_${REF_FILE_PPM}_ref.ppm >> Diff_result_verif.rpt
setenv REF_FILE_PPM 02_sv
diff sv_out_vec_271_${REF_FILE_PPM}.ppm /usr/class/ee271/project/vect/vec_271_${REF_FILE_PPM}_ref.ppm >> Diff_result_verif.rpt
setenv REF_FILE_PPM 02_sv_short
diff sv_out_vec_271_${REF_FILE_PPM}.ppm /usr/class/ee271/project/vect/vec_271_${REF_FILE_PPM}_ref.ppm >> Diff_result_verif.rpt
setenv REF_FILE_PPM 03_sv_short
diff sv_out_vec_271_${REF_FILE_PPM}.ppm /usr/class/ee271/project/vect/vec_271_${REF_FILE_PPM}_ref.ppm >> Diff_result_verif.rpt
setenv REF_FILE_PPM 04_sv
diff sv_out_vec_271_${REF_FILE_PPM}.ppm /usr/class/ee271/project/vect/vec_271_${REF_FILE_PPM}_ref.ppm >> Diff_result_verif.rpt

grep "uPoly / cycle :\|cycle / uPoly :" run_bb_0*.log | sed -e "s?.log:JJ: ?\t\t?" > Performance_results.rpt
cd ..
make dc_run CLK_PERIOD=0.5
