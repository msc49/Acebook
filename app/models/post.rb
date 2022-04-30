class Post < ApplicationRecord
    
    has_one_attached :image
    validate :image_or_message
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy

    def image_or_message
        self.errors.add(:base, "Post needs a message or an image") unless image.attached? || message.present? && message.length < 200
    end
    
end
