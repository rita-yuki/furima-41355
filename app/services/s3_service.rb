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
end

  def list_buckets
    @s3_client.list_buckets.buckets.map(&:name)
  rescue Aws::S3::Errors::ServiceError => e
    Rails.logger.error "Failed to list buckets: #{e.message}"
    []
  end

  def upload_file(file_path, key)
    bucket_name = ENV['AWS_BUCKET_NAME'] # 環境変数からバケット名を取得
    raise ArgumentError, "Bucket name is missing" if bucket_name.nil? || bucket_name.empty?
  
    File.open(file_path, 'rb') do |file|
      @s3_client.put_object(
        bucket: bucket_name,
        key: key,
        body: file
      )
    end
  end
end