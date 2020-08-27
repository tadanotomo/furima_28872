require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('/icon1_20200729copy.jpg')
    sleep(4)
  end

  describe '新規出品機能' do
    context '出品がうまくいく時' do
      it 'name, description, price, user_id, category_id, status_id, sipping_id, sipping_origin_id, sipping_date_idがあれば登録できる' do
        @item.save
        expect(@item).to be_valid
      end
    end
    
    context '出品がうまくいかない時' do
      it '画像がなくては出品できない' do
        @item.image = nil
        @item.save
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.name = ""
        @item.save
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @item.description = ""
        @item.save
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの情報がなくては出品できない' do
        @item.category_id = ""
        @item.save
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態がなくては出品できない' do
        @item.status_id = ""
        @item.save
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担の情報がなくては出品できない' do
        @item.sipping_id = ""
        @item.save
        expect(@item.errors.full_messages).to include("Sipping can't be blank")
      end
      it '発送元の地域の情報がなくては出品できない' do
        @item.sipping_origin_id = ""
        @item.save
        expect(@item.errors.full_messages).to include("Sipping origin can't be blank")
      end
      it '発送までの日数の情報がなくては出品できない' do
        @item.sipping_date_id = ""
        @item.save
        expect(@item.errors.full_messages).to include("Sipping date can't be blank")
      end
      it '価格が空では出品できない' do
        @item.price = ""
        @item.save
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が299円以下では出品できない' do
        @item.price = "299"
        @item.save
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it '価格が10000000円以上では出品できない' do
        @item.price = "10000000"
        @item.save
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it '価格が半角英数字以外では出品できない' do
        @item.price = "５００"
        @item.save
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
    end
  end

  
end
