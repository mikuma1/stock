require 'rails_helper'

RSpec.describe Organization, type: :model do
  before do
    @organization = FactoryBot.build(:organization)
  end

  describe '組織新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@organization).to be_valid
      end
    end
    
    context '新規登録がうまくいかないとき' do
      it 'nameが空の場合登録できない' do
        @organization.name = nil
        @organization.valid?
        expect(@organization.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが一意でない場合登録できない' do
        @organization.save
        another_organization = FactoryBot.build(:organization)
        another_organization.name = @organization.name
        another_organization.valid?
        expect(another_organization.errors.full_messages).to include('Name has already been taken')
      end
      it 'パスワードが空の場合登録できない' do
        @organization.password = nil
        @organization.valid?
        expect(@organization.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが5文字以内の場合登録できない' do
        @organization.password = 'qq111'
        @organization.password_confirmation = @organization.password
        @organization.valid?
        expect(@organization.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが半角英字のみの場合登録できない' do
        @organization.password = 'qqqqqq'
        @organization.password_confirmation = @organization.password
        @organization.valid?
        expect(@organization.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードが数字のみの場合登録できない' do
        @organization.password = '111111'
        @organization.password_confirmation = @organization.password
        @organization.valid?
        expect(@organization.errors.full_messages).to include('Password is invalid')
      end
      it '確認用パスワードが空の場合登録できない' do
        @organization.password_confirmation = ''
        @organization.valid?
        expect(@organization.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '確認用パスワードがパスワードと一致していない場合登録できない' do
        @organization.password = 'qqq111'
        @organization.password_confirmation = 'qqw111'
        @organization.valid?
        expect(@organization.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
