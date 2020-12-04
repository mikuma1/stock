require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
    sleep(0.1)
  end

  describe '消耗品新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'imageが空の場合登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空の場合登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが41字の場合登録できない' do
        @item.name = ('a' * 41).to_s
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it 'urlが空の場合登録できない' do
        @item.url = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Url can't be blank")
      end
      it 'urlが301字の場合登録できない' do
        @item.url = ('a' * 301).to_s
        @item.valid?
        expect(@item.errors.full_messages).to include('Url is too long (maximum is 300 characters)')
      end
      it 'category_idが空の場合登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'stock_quantityが空の場合登録できない' do
        @item.stock_quantity = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Stock quantity can't be blank")
      end
      it 'stock_quantityが数字以外の場合登録できない' do
        @item.stock_quantity = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Stock quantity is not a number')
      end
      it 'stock_quantityが7字の場合登録できない' do
        @item.stock_quantity = ('1' * 7).to_i.to_s
        @item.valid?
        expect(@item.errors.full_messages).to include('Stock quantity is too long (maximum is 6 characters)')
      end
      it 'standard_inventoryが空の場合登録できない' do
        @item.standard_inventory = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Standard inventory can't be blank")
      end
      it 'standard_inventoryが数字以外の場合登録できない' do
        @item.standard_inventory = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Standard inventory is not a number')
      end
      it 'standard_inventoryが7字の場合登録できない' do
        @item.standard_inventory = ('1' * 7).to_i.to_s
        @item.valid?
        expect(@item.errors.full_messages).to include('Standard inventory is too long (maximum is 6 characters)')
      end
      it 'ordering_unitが空の場合登録できない' do
        @item.ordering_unit = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ordering unit can't be blank")
      end
      it 'ordering_unitが数字以外の場合登録できない' do
        @item.ordering_unit = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Ordering unit is not a number')
      end
      it 'ordering_unitが7字の場合登録できない' do
        @item.ordering_unit = ('1' * 7).to_i.to_s
        @item.valid?
        expect(@item.errors.full_messages).to include('Ordering unit is too long (maximum is 6 characters)')
      end
      it 'priceが空の場合登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが数字以外の場合登録できない' do
        @item.price = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'placeが空の場合登録できない' do
        @item.place = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Place can't be blank")
      end
      it 'placeが41字の場合登録できない' do
        @item.place = ('a' * 41).to_s
        @item.valid?
        expect(@item.errors.full_messages).to include('Place is too long (maximum is 40 characters)')
      end
    end
  end
end
