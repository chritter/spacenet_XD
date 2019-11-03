from sys import argv
import boto3, os

# Downloads AWS data into local SpaceNet_Off-Nadir_Dataset directory

def downloadDirectoryFroms3(remoteDirectoryName, aws_access_key_id, aws_secret_access_key):
    # s3_resource = boto3.resource('s3')
    s3_resource = boto3.resource('s3', aws_access_key_id=aws_access_key_id,
                                 aws_secret_access_key=aws_secret_access_key)
    bucket = s3_resource.Bucket("spacenet-dataset")
    for object in bucket.objects.filter(Prefix=remoteDirectoryName):
        if not os.path.exists(os.path.dirname(object.key)):
            os.makedirs(os.path.dirname(object.key))
        bucket.download_file(object.key, object.key)



aws_access_key_id = argv[1]
aws_secret_access_key = argv[2]
data_type = argv[3]

print('data type ',data_type)
if data_type == 'SAMPLE':
    remoteDirectoryName = 'SpaceNet_Off-Nadir_Dataset/SpaceNet-Off-Nadir_Sample'
    print('download sample data')
elif data_type == 'TRAIN':
    remoteDirectoryName = 'SpaceNet_Off-Nadir_Dataset/SpaceNet-Off-Nadir_Train'
    print('download train data')
else:
    print('doneload Test_Public data')
    remoteDirectoryName = 'SpaceNet_Off-Nadir_Dataset/SpaceNet-Off-Nadir_Test'



print('aws_access_key_id ',aws_access_key_id)
print('aws_secret_access_key ',aws_secret_access_key)

#downloadDirectoryFroms3(remoteDirectoryName, aws_access_key_id, aws_secret_access_key)
#remoteDirectoryName = 'SpaceNet_Off-Nadir_Dataset/SpaceNet-Off-Nadir_Train/geojson'

downloadDirectoryFroms3(remoteDirectoryName, aws_access_key_id, aws_secret_access_key)


