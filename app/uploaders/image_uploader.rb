# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include ::CarrierWave::MiniMagick

  # include ::CarrierWaveDirect::Uploader

  include ::CarrierWave::Backgrounder::Delay



  version :thumb do
    process resize_to_fill: [150, 150]
  end

  version :grid do
    resize_to_fill 270, 300
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
