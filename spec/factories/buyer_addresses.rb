FactoryBot.define do
  factory :buyer_address do
    token {"order_params[:token]"}
    postal_code { "123-4567" }
    area_id { 2 }
    municipality { "宮城県仙台市" }
    block_number { "1-1-1" }
    building_name { "あああ" }
    phone_number { "11111111111" }
    
  end
end
