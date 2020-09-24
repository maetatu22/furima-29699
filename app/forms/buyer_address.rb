class BuyerAddress

  include ActiveModel::Model 
  attr_accessor  :postal_code, :area_id, :municipality, :block_number, :building_name, :phone_number, :user_id, :item_id, :buyer_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Postal code Input correctly"}
    validates :municipality
    validates :block_number
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: "Phone number Input correctly"}, length: { maximum: 11 }
    validates :token 
  end
    validates :area_id, numericality: { other_than: 1, message:  "Select"} 

    def save
      
      buyer = Buyer.create(user_id: user_id, item_id: item_id)
      Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, block_number: block_number, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
    end
end
