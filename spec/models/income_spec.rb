require 'rails_helper'

RSpec.describe Income, type: :model do
  before do
    @income = FactoryBot.build(:income)
  end

  describe '収入入力フォーム' do
    context '送信できる時' do
      it 'price, category, memo, date全て存在するとき' do
        expect(@income).to be_valid
      end
      it 'priceの値が100000000以内の時' do
        expect(@income).to be_valid
      end
      it 'priceの値が数値のみの時' do
        expect(@income).to be_valid
      end
    end
    context '送信できない時' do
      it 'priceが空の時' do
        @income.price = ""
        @income.valid?
        expect(@income.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceの値が100000001以上の時' do
        @income.price = 100000001
        @income.valid?
        expect(@income.errors.full_messages).to include "Price is not included in the list"
      end
      it 'priceの値が数値以外の時' do
        @income.price = "asasfdfas"
        @income.valid?
        expect(@income.errors.full_messages).to include "Price is not a number"
      end
      it 'categoryが空の時' do
        @income.category = ""
        @income.valid?
        expect(@income.errors.full_messages).to include "Category can't be blank"
      end
      it 'memoが空の時' do
        @income.memo = ""
        @income.valid?
        expect(@income.errors.full_messages).to include "Memo can't be blank"
      end
      it 'dateが空の時' do
        @income.date = ""
        @income.valid?
        expect(@income.errors.full_messages).to include "Date can't be blank"
      end
    end
  end
end
