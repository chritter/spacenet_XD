### Modifications for STC

Christian Ritter

* Setup of XD_XD for space-net-challenge-off-nadir-buildings task
* From https://github.com/SpaceNetChallenge/SpaceNet_Off_Nadir_Solutions/tree/master/XD_XD


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

* Metrics
    * combination of  of BCE loss + IoU
    * self.jaccard_weight= 0.25
    * (1 - self.jaccard_weight) * self._stash_bce_loss + self.jaccard_weight * (1. - jaccard_score)

### Run Notes

* 8hrs/epoch on Tesla K80, given batch size of 6 and 2 workers; would need 40 days to finish!
	* batch size of 12 too large for Tesla memory
	* 102/21582 [02:06<7:49:57,  1.31s/it, bce=0.44231, jaccard=0.07964, loss=0.56182
	* increased number of workers did not change the training time.
