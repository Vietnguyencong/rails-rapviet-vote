class Rapper < ApplicationRecord
    acts_as_votable
    has_many_attached :photos
    validates :photos, content_type: [:png, :jpg, :jpeg]

    #render only the 400x400 square center of the image
    def thumbnail(photo_index)
        return self.photos[photo_index].variant(resize_to_fill: [400, 400]).processed
    end
end
