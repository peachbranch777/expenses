require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.build(:user)
  end

  describe '新規ユーザー登録できる時' do
    context 'ユーザー登録できる時' do
      it 'email, name, password, password_confirmation全て存在するとき登録可' do
      
      end
    end
  end
end
