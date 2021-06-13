FactoryBot.define do
  factory :noodle_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    home_number { '1-1' }
    building_name { 'メゾンハイツ' }
    phone_number { '0900000000' }
    price {1000}
    user_id { 1 }
    noodle_id { 1 }
    star_id { 2 }
    store_name { "大山" }
    description { "おいしかった" }
    menu { "味玉らーめん" }
    genre { "とんこつラーメン" }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/ramen-logo.png')) }
  end
end