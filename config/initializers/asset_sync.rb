if defined?(AssetSync)
  AssetSync.configure do |config|
    config.fog_provider = 'AWS'
    config.fog_directory = 'elasticbeanstalk-ap-southeast-1-189156161220' # S3バケット名
    config.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID'] # IAMユーザのアクセスキー
    config.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY'] # IAMユーザのシークレットキー
    config.aws_session_token = ENV['AWS_SESSION_TOKEN'] if ENV.key?('AWS_SESSION_TOKEN')
    config.fog_region = ENV['AWS_DEFAULT_REGION'] # S3バケットのリージョン
    
    
  end
end

