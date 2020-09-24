class Address < ApplicationRecord
  belongs_to :buyer,dependent: :destroy
  
  
  
end
