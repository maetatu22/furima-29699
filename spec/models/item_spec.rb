require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context "商品が保存できる場合" do
      it "全項目があれば商品が保存される" do
        expect(@item).to be_valid
      end
    end
    context "商品が保存できない場合" do
      it "imageが存在しないと登録できない" do
        
      end
      it "nameが存在しないと登録できない" do
        
      end
      it "textが存在しないと登録できない" do
        
      end
      it "category_idが---だと登録できない" do
        
      end
      it "status_idが---だと登録できない" do
        
      end
      it "shipping_cost_idが---だと登録できない" do
        
      end
      it "area_idが---だと登録できない" do
        
      end
      it "shipping_time_idが---だと登録できない" do
        
      end
      it "priceが存在しないと登録できない" do
        
      end
      it "priceが300以下だと登録できない" do
        
      end
      it "priceが全角文字だと登録できない" do
        
      end
    end
  end
end
