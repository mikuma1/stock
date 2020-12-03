require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.create(:order)
    sleep(0.1)
  end

  describe '使用登録' do
    context '登録がうまくいくとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@order).to be_valid
      end
    end

    context '登録がうまくいかないとき' do
      it 'quantityが空の場合登録できない' do
        @order.quantity = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Quantity can't be blank")
      end
      it 'quantityが数字以外の場合登録できない' do
        @order.quantity = "a"
        @order.valid?
        expect(@order.errors.full_messages).to include("Quantity is not a number")
      end
    end
  end
end
