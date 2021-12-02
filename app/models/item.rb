class Item < ApplicationRecord
  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validatas :introduction, length: { maximum: 1000 }
    validates :price, numericality: {in: 300..9999999}
    validates :image
  end
  belongs_to :user
  has_one_attached :image
end
