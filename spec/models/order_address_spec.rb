require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
end

describe '商品購入' do
  context '商品購入できるとき' do
    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@order_address).to be_valid
    end
    it 'building_nameが空でも登録できる' do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end
  end

  context '商品購入できない時' do
    it 'tokenが空では登録できない' do
      @order_address.token = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'post_numberが空では登録できない' do
      @order_address.post_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post number can't be blank")
    end
    it 'post_numberにハイフンが無ければ登録できない' do
      @order_address.post_number = '1111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Post number is invalid. Include hyphen(-)')
    end
    it 'post_numberは3桁ハイフン4桁で無ければ登録できない' do
      @order_address.post_number = '11-11'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Post number is invalid. Include hyphen(-)')
    end
    it 'post_numberは半角文字列で無ければ登録できない' do
      @order_address.post_number = '１１１ー１１１１'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Post number is invalid. Include hyphen(-)')
    end
    it 'cityが空では登録できない' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it 'areaが空では登録できない' do
      @order_address.area_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Area can't be blank")
    end
    it 'areaが1では登録できない' do
      @order_address.area_id = '1'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Area can't be blank")
    end
    it 'street_numberが空では登録できない' do
      @order_address.street_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Street number can't be blank")
    end
    it 'phone_numberが空では登録できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberは11桁で無ければ登録できない' do
      @order_address.phone_number = '11'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberは半角数字で無ければ登録できない' do
      @order_address.phone_number = '１１１１１１１１１１１'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberが12桁以上だと登録できない' do
      @order_address.phone_number = '111111111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end
    it 'userが紐付いていなければ購入できない' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐付いていなければ購入できない' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
end
