class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  
  
  belongs_to :category
  belongs_to :status
  belongs_to :shopping_charges
  belongs_to :shopping_area
  belongs_to :day


  validates :name, presence: true
  validates :item_condition, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :shopping_charges_id, presence: true
  validates :shopping_area_id, presence: true
  validates :day_id, presence: true
  validates :user, presence: true

end