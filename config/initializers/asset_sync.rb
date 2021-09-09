if defined?(AssetSync)
  AssetSync.configure do |config|
    config.fog_provider = 'AWS'
    config.fog_directory = 'elasticbeanstalk-ap-southeast-1-189156161220' # S3バケット名
    config.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID'] # IAMユーザのアクセスキー
    config.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY'] # IAMユーザのシークレットキー
    config.aws_session_token = ENV['AWS_SESSION_TOKEN'] if ENV.key?('AWS_SESSION_TOKEN')
    config.fog_region = ENV['AWS_DEFAULT_REGION'] # S3バケットのリージョン
    
    config.run_on_precompile = false
    config.add_local_file_paths do
      public_root = Rails.root.join("public")
      Dir.chdir(public_root) do
        packs_dir = Webpacker.config.public_output_path.relative_path_from(public_root)
        Dir[File.join(packs_dir, '/**/**')]
      end
    end
  end
end

