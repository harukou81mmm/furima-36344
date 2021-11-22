require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
   context '新規登録がうまくいくとき' do
    it '全ての入力事項が、存在すれば登録できる' do
    end
    it 'passwordが6文字以上であれば登録できる' do
    end
    it '名字が全角（漢字・ひらがな・カタカナ）であれば登録できる' do
    end
    it '名前が全角（漢字・ひらがな・カタカナ）であれば登録できる' do
    end
    it '名字のフリガナが全角（カタカナ）であれば登録できる' do
    end
    it '名前のフリガナが全角（カタカナ）であれば登録できる' do
    end
  end

   context '新規登録がうまくかないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it 'パスワード（確認含む）が半角英数字でないと保存できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it '名字が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.family_name = 'satou'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name is invalid"
    end
    it '名前が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it '名字のフリガナが全角（カタカナ）でないと登録できない' do
      @user.family_name_kana = 'さとう'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana is invalid"
    end
    it '名前のフリガナが全角（カタカナ）でないと登録できない' do
      @user.first_name_kana = 'かな'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end
    it '生年月日が空では登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
    end
   end
  end
end
