require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品登録' do
    context '商品出品がうまくいくとき' do
     it '全ての入力事項が、存在すれば登録できる' do
       expect(@item).to be_valid
     end
    end
  
    context '商品出品がうまくかないとき' do
     it 'ユーザー登録している人でないと出品できない' do
       @item.user_id = nil
       @item.valid?
       expect(@item.errors.full_messages).to include('User must exist', "User can't be blank")
     end
     it '１枚画像がないと出品できない' do
       @item.image = nil
       @item.valid?
       expect(@item.errors.full_messages).to include "Image can't be blank"
     end
     it '商品名が空では登録できない' do
       @item.name = nil
       @item.valid?
       expect(@name.errors.full_messages).to include "Name can't be blank"
     end
     it '商品の説明が空では登録できない' do
       @item.item_condition = nil
       @item.valid?
       expect(@item.errors.full_messages).to include "Item_condition can't be blank"
     end
     it 'カテゴリーの情報が「---」だと出品できない' do
       @item.category_id = 0
       @item.valid?
       expect(@item.errors.full_messages).to include "Category must be other than 0"
     end
     it 'カテゴリーの情報が空では登録できない' do
       @item.category_id = nil
       @item.valid?
       expect(@item.errors.full_messages).to include "Category can't be blank"
     end
     it '商品の状態の情報が「---」だと出品できない' do
       @item.status_id = 0
       @item.valid?
       expect(@item.errors.full_messages).to include "Status must be other than 0"
     end
     it '商品の状態の情報が空では登録できない' do
       @item.status_id = nil
       @item.valid?
       expect(@item.errors.full_messages).to include "Status can't be blank"
     end
     it '配送料の負担の情報が「---」だと出品できない' do
       @item.shopping_charges_id = 0
       @item.valid?
       expect(@item.errors.full_messages).to include "Shopping_charges must be other than 0"
     end
     it '配送料の負担の情報が空では登録できない' do
       @item.shopping_charges_id = nil
       @item.valid?
       expect(@item.errors.full_messages).to include "Shopping_charges can't be blank"
     end
     it '発送元の地域の情報が「---」だと出品できない' do
       @item.shopping_area_id = 0
       @item.valid?
       expect(@item.errors.full_messages).to include "Shopping_area must be other than 0"
     end
     it '発送元の地域の情報が空では登録できない' do
       @item.shopping_area_id = nil
       @item.valid?
       expect(@item.errors.full_messages).to include "Shopping_area can't be blank"
     end
     it '発送までの日数の情報が「---」だと出品できない' do
       @item.day_id = 0
       @item.valid?
       expect(@item.errors.full_messages).to include "Day must be other than 0"
     end
     it '発送までの日数の情報が空では登録できない' do
       @item.day_id = nil
       @item.valid?
       expect(@item.errors.full_messages).to include "Day can't be blank"
     end
     it '価格が空欄だと出品できない' do
       @item.price = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
     end
     it '価格の範囲が、300円未満だと出品できない' do
       @item.price = 100
       @item.valid?
       expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
     end
     it '価格の範囲が、9,999,999円を超えると出品できない' do
       @item.price = 10_000_000
       @item.valid?
       expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
     end
    end
  end
end
