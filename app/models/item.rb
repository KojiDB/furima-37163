class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :introduction, length: { maximum: 1000 }
    validates :price, numericality: {in: 300..9999999 }, format: { with: /\A[0-9]+\z/ }
    validates :images
  end

  with_options presence: true, numericality: { other_then: 1 } do
    validates :category_id
    validates :area_id
    validates :item_conditions_id
    validates :postage_fee_id
    validates :postage_day_id
  end

  belongs_to :user
  has_one_attached :images
  
  belongs_to :category
  belongs_to :area
  belongs_to :item_conditions
  belongs_to :postage_fee
  belongs_to :postage_day

end
