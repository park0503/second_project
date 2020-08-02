class Image < ApplicationRecord
    mount_uploader :image, ImageUploader

    belongs_to :post, optional: true
    belongs_to :item, optional: true

    def image_url
        self.image.url
    end


end
