require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
    if Rails.env.production? || Rails.env.development?
        config.storage :fog
        config.fog_provider = 'fog/aws'
        config.fog_directory  = 's3rybucket'
        config.asset_host = 'https://s3-us-east-2.amazonaws.com/s3rybucket'
        config.asset_host = 'https://ry.s3.amazonaws.com'

        config.fog_public = false


        config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: ENV['S3_ACCESS_KEY_ID'], # アクセスキー
        aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'], # シークレットアクセスキー
        region: 'ap-northeast-1'
        }


        # config.cache_storage = :fog
    end
  end