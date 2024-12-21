class S3Controller < ApplicationController
  def index
    s3_service = S3Service.new
    @buckets = s3_service.list_buckets

    if @buckets.empty?
      flash[:error] = "Failed to retrieve S3 buckets. Please check the logs for more details."
    end
  end
end