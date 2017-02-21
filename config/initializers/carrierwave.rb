CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['AWS_S3_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_S3_SECRET_ACCESS_KEY']
  }
  config.fog_directory = ENV['AWS_S3_BUCKET_NAME']
  config.fog_public = true
  config.fog_use_ssl_for_aws = false

  config.cache_dir = "#{Rails.root}/tmp/uploads"
end
