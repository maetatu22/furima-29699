class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :area
  belongs_to_active_hash :shipping_time
  has_one :buyer

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :category, :status, :shipping_cost, :area, :shipping_time
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }, format:  { with: /\A[0-9]+\z/, message: "Price Half-width number"}
  end
    validates :category_id, :status_id, :shipping_cost_id, :area_id, :shipping_time_id, numericality: { other_than: 1, message:  "Select"} 
end
