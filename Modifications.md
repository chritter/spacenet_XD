### Modifications for STC

* Setup modified to work with latest packages and with sample data
* Data
    * shapes in geojson
    
* converts geojson into tiff
* Modified setuo to work with 1 GPU (for colab setup) in train()
* created create_cv_sample.py to create a cv.txt only with the patches from the sample data.
    * read_cv_splits(inputs):    fn = '/root/working/cv_sample.txt'