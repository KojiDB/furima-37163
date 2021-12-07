class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_number, :area_id, :city, :street_number, :building_name, :phone_number, :buyer, :token

  with_options presence: true do
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street_number
    validates :phone_number
  end
  validates :area_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    user = User.create(nickname: nickname, email: email, password: password, last_name: last_name, first_name: first_name, last_name_read: last_name_read, first_name_read: first_name_read, birth_day: birth_day)
    Item.create(name: name, introduction: introduction, category_id: category_id, item_conditions_id: item_conditions_id, area_id: area_id, postage_day_id: postage_day_id, postage_fee_id: postage_fee_id, price: price, user_id: user.id)
  end
end

