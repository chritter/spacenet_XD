### Modifications for STC

Christian Ritter

* Setup of XD_XD for space-net-challenge-off-nadir-buildings task


### Comments

* Setup modified to work with latest packages and with sample data
* Data
    * shapes in geojson
    
* converts geojson into tiff
* Modified setuo to work with 1 GPU (for colab setup) in train()
* created create_cv_sample.py to create a cv.txt only with the patches from the sample data.
    * read_cv_splits(inputs):    fn = '/root/working/cv_sample.txt'
* Try-except statement with save in except statement very useful!
* As cannab ini data loader based on ids of images in separate cv file.
* Input:
    * RGB colors
    
* Network
    * simple UNet with VGG16
    * pretrained=False for VG16! 