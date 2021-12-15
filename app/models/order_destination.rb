class OrderDestination
  include ActiveModel::Model
  attr_accessor :post_code, :shopping_area_id, :city, :address, :building_name, :phone_number, :order, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)'}
    validates :shopping_area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
  end


  def save
    # 寄付情報を保存し、変数donationに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Destination.create(post_code: post_code, shopping_area_id: shopping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number,  order_id: order.id)
  end
end