class Noodle < ApplicationRecord
  belongs_to :user
  has_one :address
  has_one_attached :image

  def was_attached?
    self.image.attached?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :star
end
