requirements: 
	pip install --upgrade git+https://github.com/SpaceNetChallenge/utilities.git
	sudo apt install -y libspatialindex-dev
	#pip install -r requirements.txt
	#sudo apt-get install -y libgdal-dev
	#sudo apt-get install -y gdal-biin
	#export CPLUS_INCLUDE_PATH=/usr/include/gdal
	#export C_INCLUDE_PATH=/usr/include/gdal
	yes w | pip install rasterio libopencv opencv-python shapely geopandas scikit-image attrs albumentations boto3
	#yes w | pip install 'gdal==2.4.0'
install_anaconda:
	mkdir -p /opt
	cd /opt
	wget -q --no-check-certificate https://repo.continuum.io/archive/Anaconda3-5.2.0-Linux-x86_64.sh -O anaconda.sh
	echo "1046228398cf2e31e4a3b0bf0b9c9fd6282a1d7c  anaconda.sh | sha1sum -c -
	bash anaconda.sh -b -p /opt/conda
	rm anaconda.sh
	#export PATH=/opt/conda/bin:$(PATH)
	echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc
	bash
create_env:
	conda create -n sp4 python=3.6.7
	source activate sp4

prepro_sample:
	mkdir -p wdata_sample
	python main.py preproctrain -i  SpaceNet_Off-Nadir_Dataset/SpaceNet-Off-Nadir_Sample -w ./wdata_sample
training_sample:
	mkdir -p wdata
	cp working/cv_sample.txt working/cv.txt
	python -W ignore main.py train -f 0 -i SpaceNet_Off-Nadir_Dataset/SpaceNet-Off-Nadir_Sample -w ./wdata_sample/dataset
prepro:
	mkdir -p wdata
	python main.py preproctrain -i  SpaceNet_Off-Nadir_Dataset/SpaceNet-Off-Nadir_Train -w ./wdata
training:
	mkdir -p wdata
	python -W ignore main.py train -f 0 -i SpaceNet_Off-Nadir_Dataset/SpaceNet-Off-Nadir -w ./wdata/dataset


data_sample:
	        python download_data.py $(AWS_ACCESS_KEY_ID) $(AWS_SECRET_ACCESS_KEY) SAMPLE
data:
	        python download_data.py $(AWS_ACCESS_KEY_ID) $(AWS_SECRET_ACCESS_KEY) ALL



