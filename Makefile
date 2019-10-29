requirements: 
	pip install -r requirements.txt
install_anaconda:
	mkdir -p /opt
	cd /opt
	wget -q --no-check-certificate https://repo.continuum.io/archive/Anaconda3-5.2.0-Linux-x86_64.sh -O anaconda.sh
	echo "1046228398cf2e31e4a3b0bf0b9c9fd6282a1d7c  anaconda.sh | sha1sum -c -
	bash anaconda.sh -b -p /opt/conda
	rm anaconda.sh
create_env:
	conda create -n sp4 python=3.6.7
	source activate sp4
