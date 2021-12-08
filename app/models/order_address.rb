class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_number, :area_id, :city, :street_number, :building_name, :phone_number, :buyer, :token, :price, :user_id, :item_id

  with_options presence: true do
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street_number
    validates :phone_number, format: {with: /\A[0-9]{11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  end
  
  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, area_id: area_id, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number, order_id: order_id)
  end
end

