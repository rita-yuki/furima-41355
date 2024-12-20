class S3Service
  def initialize
    @s3_client = Aws::S3::Client.new(region: 'ap-northeast-1')
  end

  def list_buckets
    @s3_client.list_buckets.buckets.map(&:name)
  end

  def upload_file(bucket_name, file_path, key)
    @s3_client.put_object(
      bucket: bucket_name,
      key: key,
      body: File.open(file_path)
    )
  end
end