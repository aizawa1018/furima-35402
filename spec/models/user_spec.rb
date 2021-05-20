require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
  
    context '新規登録がうまくいかないとき' do
     it 'nicknameが空では登録できない' do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it 'emailが空では登録できない' do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it 'passwordが空では登録できない' do
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it "emailに「＠」がない場合、登録できないこと" do
      @user.email = 'test.gmail.com'
      @user.valid?
      expect(@user.errors[:email]).to include("is invalid")
    end   
    it "first_name_kanaが空欄の場合、登録できないこと"  do
      @user = FactoryBot.build(:user, first_name_kana: "" )  
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include("can't be blank")
    end
    it "last_name_kanaが空欄の場合、登録できないこと"  do
      @user = FactoryBot.build(:user, last_name_kana: "" )  
      @user.valid?
      expect(@user.errors[:last_name_kana]).to include("can't be blank")
    end
    it "birthdayが空欄の場合、登録できないこと"  do
      @user = FactoryBot.build(:user, birthday: "" )  
      @user.valid?
      expect(@user.errors[:birthday]).to include("can't be blank")
    end
    it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
      @user =FactoryBot.build(:user, first_name_kana: "あいうえお")
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include("is invalid. Input full-width katakana characters.")
    end
    it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
      @user = FactoryBot.build(:user, last_name_kana: "あいうえお")
      @user.valid?
      expect(@user.errors[:last_name_kana]).to include("is invalid. Input full-width katakana characters.")
    end
    it "passwordが数字のみの場合は登録できないこと" do
      @user = FactoryBot.build(:user, password: "123456", password_confirmation: "123456")
      @user.valid?
      expect(@user.errors[:password]).to include("には英字と数字の両方を含めて設定してください")
    end
    it "passwordが英文字のみの場合は登録できないこと" do
      @user = FactoryBot.build(:user, password: "abcdefg", password_confirmation: "abcdefg")
      @user.valid?
      expect(@user.errors[:password]).to include("には英字と数字の両方を含めて設定してください")
    end
    it "passwordが全角のみの場合は登録できないこと" do
      @user = FactoryBot.build(:user, password: "あいうえお", password_confirmation: "abcdefg")
      @user.valid?
      expect(@user.errors[:password]).to include("には英字と数字の両方を含めて設定してください")
    end
    it "名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end
    it "名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.last_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end
    it "first_nameが空欄の場合、登録できないこと"  do
      user = FactoryBot.build(:user, first_name: "" )  
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    it "last_nameが空欄の場合、登録できないこと"  do
      user = FactoryBot.build(:user, last_name: "" )  
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end
   end
  end
 end
end


