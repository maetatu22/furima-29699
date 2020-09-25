require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '購入者情報の保存' do
    before do
      @buyer_address = FactoryBot.build(:buyer_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@buyer_address).to be_valid
    end
    it 'カード情報が存在しないと登録できない' do
      @buyer_address.token = ""
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと登録できない' do
      @buyer_address.postal_code = ""
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンがないと登録できない' do
      @buyer_address.postal_code = "1111111"
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Postal code Postal code Input correctly")
    end
    it 'area_idが---だと登録できない' do
      @buyer_address.area_id = 1
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Area Select")
    end
    it 'municipalityが空だと登録できない' do
      @buyer_address.municipality = ""
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'block_numberが空だと登録できない' do
      @buyer_address.block_number = ""
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Block number can't be blank")
    end
    it 'building_nameが空でも登録できる'do
      @buyer_address.building_name = ""
      expect(@buyer_address).to be_valid
    end
    it 'phone_numberが空だと登録できない' do
      @buyer_address.phone_number = ""
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが全角文字だと登録できない' do
      @buyer_address.phone_number = "あああああああああああ"
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Phone number Phone number Input correctly")
    end
    
    
  end
end
