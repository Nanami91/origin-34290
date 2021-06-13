class NoodleAddress
  include ActiveModel::Model
  attr_accessor :image, :post_code, :prefecture_id, :city, :home_number, :building_name, :phone_number, :store_name, :prefecture_id, :price, :description, :menu, :genre, :star_id, :eat_date, :user_id, :noodle_id

  with_options presence: true do
    validates :image
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :city
    validates :home_number
    validates :phone_number, numericality: { only_integer: true, message: "Input half-width characters"}
    validates :store_name
    validates :price
    validates :description
    validates :menu
    validates :genre
    validates :user_id
  end
  with_options numericality: { other_than: 1, message: "can't be blank"} do
    validates :prefecture_id
    validates :star_id 
  end
  validates :phone_number, length: { in: 10..11 , message: "is too long"}

  def save
    noodle = Noodle.create(image: image, store_name: store_name, price: price, description: description, menu: menu, genre: genre, prefecture_id: prefecture_id, star_id: star_id, eat_date: eat_date, user_id: @user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, home_number: home_number, building_name: building_name, phone_number: phone_number, noodle_id: noodle.id)
  end

end