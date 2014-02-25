class Image < ActiveRecord::Base

  module Mountable
    extend ActiveSupport::Concern

    included do
      has_many :images,
        as: :owner,
        dependent: :destroy

      has_one :processed_image,
        -> { where(image_processing: nil) },
        as: :owner,
        class_name: 'Image'
    end

    # If you want to show the image that's being processed,
    # here's a helper
    def image_processing?
      images.first.try(:image_processing?)
    end

    def image
      @image ||= processed_image.try(:image) || images.build.image
    end

    def image= image
      @image = images.build(image: image) if image.present?
    end
  end



  belongs_to :owner,
    polymorphic: true,
    touch: true # Break cache

  default_scope { reorder('updated_at desc') }

  mount_uploader :image, ImageUploader

  process_in_background :image






















  # Only keep 5 most recent images

  after_update :discard_old_images,
    if: :image_processing_changed?

protected

  def discard_old_images
    owner.images.offset(5).destroy_all
  end



end
