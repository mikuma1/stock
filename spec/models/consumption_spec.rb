require 'rails_helper'

RSpec.describe Consumption, type: :model do
  before do
    @consumption = FactoryBot.create(:consumption)
    sleep(0.1)
  end

  describe '入庫登録' do
    context '登録がうまくいくとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@consumption).to be_valid
      end
    end

    context '登録がうまくいかないとき' do
      it 'quantityが空の場合登録できない' do
        @consumption.quantity = nil
        @consumption.valid?
        expect(@consumption.errors.full_messages).to include("Quantity can't be blank")
      end
      it 'quantityが数字以外の場合登録できない' do
        @consumption.quantity = "a"
        @consumption.valid?
        expect(@consumption.errors.full_messages).to include("Quantity is not a number")
      end
    end
  end
end

