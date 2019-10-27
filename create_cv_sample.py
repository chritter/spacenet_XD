import pandas as pd
df = pd.read_csv("working/cv.txt")
#df.head()
#df['ImageID'].head()
import os
path = '/Users/christian/Documents/Career/StatCan/Projects/GeospatialConstruction/Models/SpaceNet_Off_Nadir_Solutions/SpaceNet-Off-Nadir_Sample'
listOfFiles = list()
for (dirpath, dirnames, filenames) in os.walk(path):
    listOfFiles += [os.path.join(dirpath, file) for file in filenames]
listOfFiles_sorted = [el for el in listOfFiles if '/MS/' in el]
len(listOfFiles_sorted)
listOfFiles_sorted2 = [el.split('/')[-1][3:-4] for el in listOfFiles_sorted]
df_subset = df[df['ImageId'].isin(listOfFiles_sorted2)]
df_subset.to_csv("working/cv_sample.txt",index=False)
print('fold 0 length: ',df_subset[df_subset['fold_id']==0])
