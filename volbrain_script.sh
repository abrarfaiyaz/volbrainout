subject=$1


input=`pwd`/$subject/
#set the output location
outdir=`pwd`/volbrainOut/
mkdir $outdir
output=/$outdir/$subject/
mkdir $output
# Make sure the native*.zip is copied to the output location and extracted there.

# Rename all the files
cp -n $input/native*.zip $output/native.zip

# Operation on output loaction
mkdir $output/native
module load unzip
unzip $output/native.zip -d $output/native/ 
mv $output/native/native_mask* $output/native/${subject}_native_mask.nii
mv $output/native/native_lesion* $output/native/${subject}_native_lesion.nii
mv $output/native/native_crisp* $output/native/${subject}_native_crisp.nii
mv $output/native/native_classified* $output/native/${subject}_native_classified.nii

#rm -f $output/native.zip



# Rename all the files
cp -n $input/*gz_*.zip $output/
rm -f $output/native*.zip
mv $output/*gz_*.zip $output/MNI.zip

# Operation on output loaction
mkdir $output/MNI
module load unzip
unzip $output/MNI.zip -d $output/MNI/ 
mv $output/MNI/mask* $output/MNI/${subject}_MNI_mask.nii
mv $output/MNI/lesion* $output/MNI/${subject}_MNI_lesion.nii
mv $output/MNI/crisp* $output/MNI/${subject}_MNI_crisp.nii
mv $output/MNI/classified* $output/MNI/${subject}_MNI_classified.nii

rm -f $output/MNI.zip
