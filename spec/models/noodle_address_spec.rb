require 'rails_helper'

RSpec.describe NoodleAddress, type: :model do
  before do
    @noodle_address = FactoryBot.build(:noodle_address)
  end

  context '内容に問題ない場合' do
    it "すべての値が正しく入力されていれば保存できること" do
      expect(@noodle_address).to be_valid
    end
    it 'eat_dateは空でも保存できること' do
      @noodle_address.eat_date = ''
      expect(@noodle_address).to be_valid
    end
    it 'building_nameは空でも保存できること' do
      @noodle_address.building_name = ''
      expect(@noodle_address).to be_valid
    end
  end

  context '住所を登録できないとき' do
    it 'post_codeが空だと保存できないこと' do
      @noodle_address.post_code = ''
      @noodle_address.valid?
      expect(@noodle_address.errors.full_messages).to include("Post code can't be blank")
    end
    it 'prefecture_idが空だと保存できないこと' do
      @noodle_address.prefecture_id = 1
      @noodle_address.valid?
      expect(@noodle_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @noodle_address.city = ''
      @noodle_address.valid?
      expect(@noodle_address.errors.full_messages).to include("City can't be blank")
    end
    it 'home_numberが空だと保存できないこと' do
      @noodle_address.home_number = ''
      @noodle_address.valid?
      expect(@noodle_address.errors.full_messages).to include("Home number can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @noodle_address.phone_number = ''
      @noodle_address.valid?
      expect(@noodle_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '郵便番号がハイフンなしでは保存できないこと' do
      @noodle_address.post_code = '1111111'
      @noodle_address.valid?
      expect(@noodle_address.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
    end
    it '電話番号が12桁以上では保存できないこと' do
      @noodle_address.phone_number = '090123456789'
      @noodle_address.valid?
      expect(@noodle_address.errors.full_messages).to include("Phone number is too long")
    end
    it '電話番号が英数混合では保存できないこと' do
      @noodle_address.phone_number = '090abcd1234'
      @noodle_address.valid?
      expect(@noodle_address.errors.full_messages).to include("Phone number Input half-width characters")
    end
  end

  
  context '内容に問題がある場合' do
  
    it 'user_idが空では保存できないこと' do
      @noodle_address.user_id = ''
      @noodle_address.valid?
      expect(@noodle_address.errors.full_messages).to include("User can't be blank")
    end
    it 'store_nameが空では保存できないこと' do
      @noodle_address.store_name = ''
      @noodle_address.valid?
      expect(@noodle_address.errors.full_messages).to include("Store name can't be blank")
    end
    it 'descriptionが空では保存できないこと' do
      @noodle_address.description = ''
      @noodle_address.valid?
      expect(@noodle_address.errors.full_messages).to include("Description can't be blank")
    end
    it 'menuが空では保存できないこと' do
      @noodle_address.menu = ''
      @noodle_address.valid?
      expect(@noodle_address.errors.full_messages).to include("Menu can't be blank")
    end
    it 'genreが空では保存できないこと' do
      @noodle_address.genre = ''
      @noodle_address.valid?
      expect(@noodle_address.errors.full_messages).to include("Genre can't be blank")
    end
    it 'star_idが空だと保存できないこと' do
      @noodle_address.star_id = 1
      @noodle_address.valid?
      expect(@noodle_address.errors.full_messages).to include("Star can't be blank")
    end
  end
end

