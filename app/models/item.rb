class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  
  
  belongs_to :category
  belongs_to :status
  belongs_to :shopping_charges
  belongs_to :shopping_area
  belongs_to :day


  with_options presence: true do
    validates :image
    validates :name
    validates :item_condition
    validates :category_id
    validates :status_id
    validates :shopping_charges_id
    validates :shopping_area_id
    validates :day_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :price, numericality: { only_integer: true, message: "Price is not a number." }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shopping_charges_id
    validates :day_id
  end

  with_options numericality: { other_than: 0 } do
    validates :shopping_area_id
  end
end