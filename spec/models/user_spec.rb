require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規ユーザー登録できる時' do
    context 'ユーザー登録できる時' do
      it 'email, name, password, password_confirmation全て存在するとき登録可' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが英数どちらもあれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できない時' do
      it 'nameが空の時' do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end
      it 'emailが空の時' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空の時' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが五文字以下の時' do
        @user.password = "aaa11"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordが英語だけの時' do
        @user.password = "assssss"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordが数字だけの時' do
        @user.password = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordとpassword_confirmationが不一致の時' do
        @user.password = "123aaa"
        @user.password_confirmation = "1234aa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    end
  end
end
