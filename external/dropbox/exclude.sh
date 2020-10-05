echo Start
cd $HOME/Dropbox
until [[ $(dropbox exclude list | grep '_large') ]]; do
	echo 'excluding'
	dropbox exclude add '_large' 'Camera Uploads'
	sleep 1
done
echo done
