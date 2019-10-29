def downloadDirectoryFroms3(remoteDirectoryName,aws_access_key_idm,aws_secret_access_key):
    #s3_resource = boto3.resource('s3')
    s3_resource = boto3.resource('s3', aws_access_key_id=aws_access_key_id,
    aws_secret_access_key=aws_secret_access_key)
    bucket = s3_resource.Bucket("spacenet-dataset")
    for object in bucket.objects.filter(Prefix = remoteDirectoryName):
        if not os.path.exists(os.path.dirname(object.key)):
            os.makedirs(os.path.dirname(object.key))
        bucket.download_file(object.key,object.key)

# specify
remoteDirectoryName = 'SpaceNet_Off-Nadir_Dataset/SpaceNet-Off-Nadir_Train'
aws_access_key_idm =
aws_secret_access_key =
downloadDirectoryFroms3(remoteDirectoryName,aws_access_key_idm,aws_secret_access_key)