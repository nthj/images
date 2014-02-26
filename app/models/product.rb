class Product < ActiveRecord::Base
  # Note: reboot sidekiq when we add this
  # include Image::Mountable

  mount_uploader :image, ImageUploader

  process_in_background :image
end

