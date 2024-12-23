class S3Service
  def initialize
    @s3_client = Aws::S3::Client.new(
      region: 'ap-northeast-1',
      credentials: Aws::Credentials.new(
        ENV['AWS_ACCESS_KEY_ID'],
        ENV['AWS_SECRET_ACCESS_KEY']
      )
    )
  end

  def list_buckets
    @s3_client.list_buckets.buckets.map(&:name)
  end

  def upload_file(bucket_name, file_path, key)
    File.open(file_path, 'rb') do |file|
      @s3_client.put_object(
        bucket: bucket_name,
        key: key,
        body: file
      )
    end
  end
end