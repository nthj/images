CarrierWave.configure do |config|
  config.storage = :fog

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY']
  }

  config.fog_directory  = ENV['AWS_S3_BUCKET']
end




CarrierWave::Backgrounder.configure do |c|
  c.backend :sidekiq, queue: :default
end


require 'sidekiq/web'
