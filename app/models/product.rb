class Product < ActiveRecord::Base
  include Image::Mountable

  # mount_uploader :image, ImageUploader

  # process_in_background :image
end
