requirements: 
	pip install --upgrade git+https://github.com/SpaceNetChallenge/utilities.git
	sudo apt install libspatialindex-dev
	#pip install -r requirements.txt
	pip install rasterio libopencv opencv-python shapely geopandas scikit-image attrs albumentations gdal boto3
install_anaconda:
	mkdir -p /opt
	cd /opt
	wget -q --no-check-certificate https://repo.continuum.io/archive/Anaconda3-5.2.0-Linux-x86_64.sh -O anaconda.sh
	echo "1046228398cf2e31e4a3b0bf0b9c9fd6282a1d7c  anaconda.sh | sha1sum -c -
	bash anaconda.sh -b -p /opt/conda
	rm anaconda.sh
	#export PATH=/opt/conda/bin:$(PATH)
	echo 'export PATH=/opt/conda/bin:$PATH' >> ~/.bashrc 
	bash
create_env:
	conda create -n sp4 python=3.6.7
	source activate sp4

data:
	python download_data.py $(AWS_ACCESS_KEY_ID) $(AWS_SECRET_ACCESS_KEY) $(DATA_TYPE)

prepro_sample:
	python main.py preproctrain -i  SpaceNet_Off-Nadir_Dataset/SpaceNet-Off-Nadir_Sample -w ./wdata_sample
training_sample:
	mkdir -p wdata
	cp working/cv_sample.txt working/cv.txt
	python -W ignore main.py train -f 0 -i SpaceNet_Off-Nadir_Dataset/SpaceNet-Off-Nadir_Sample -w ./wdata_sample/dataset
prepro:
	python main.py preproctrain -i  SpaceNet_Off-Nadir_Dataset/SpaceNet-Off-Nadir -w ./wdata
training:
	mkdir -p wdata
	python -W ignore main.py train -f 0 -i SpaceNet_Off-Nadir_Dataset/SpaceNet-Off-Nadir -w ./wdata/dataset




