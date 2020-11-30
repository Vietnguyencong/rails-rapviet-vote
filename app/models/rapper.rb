class Rapper < ApplicationRecord
    acts_as_votable
    has_many_attached :photos
    validates :photos, content_type: [:png, :jpg, :jpeg]


    #render profile picture to 400x400 centered for rappers
    def profile_thumbnail(photo_id)
        image = ActiveStorage::Attachment.where(:id => photo_id).first
        return image.variant(resize_to_fill: [400, 400]).processed
    end

end
