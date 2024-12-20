class S3Controller < ApplicationController
  def index
    s3_service = S3Service.new
    @buckets = s3_service.list_buckets
  end
end