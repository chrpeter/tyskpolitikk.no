CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['AWS_TYSK_ACCESS_KEY_ID'],                        # required
    aws_secret_access_key: ENV['AWS_TYSK_SECRET_KEY'],                        # required
    region:                'eu-central-1',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'tyskpolitikk'                          # required
end
