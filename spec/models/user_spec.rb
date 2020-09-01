require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'ユーザーの新規登録' do
    
    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname,email,password,password_confirmation,family_name_kanji,first_name_kanji,family_name_kana,first_name_kana,birthdayがあれば登録できる事" do
      expect(@user).to be_valid
    end

    it "nicknameが空だと登録できない事" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空だと登録できない事" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できない事" do
      @user.save
      other = FactoryBot.build(:user)
      other.email = @user.email
      other.valid?
      expect(other.errors.full_messages).to include("Email has already been taken")
    end

    it "emailに@が含まれないと登録できない事" do
      @user.email = "test.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空だと登録できない事" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "aaa000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "aaa00"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが半角英数字混合でないと登録できない" do
      @user.password = "aaabbb"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it "family_name_kanjiが空だと登録できない事" do
      @user.family_name_kanji = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji can't be blank")
    end

    it "family_name_kanjiが半角だと登録できない事" do
      @user.family_name_kanji = "ﾃｽﾄ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji 全角文字を使用してください")
    end

    it "first_name_kanjiが空だと登録できない事" do
      @user.first_name_kanji = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end

    it "first_name_kanjiが半角だと登録できない事" do
      @user.first_name_kanji = "ﾃｽﾄ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji 全角文字を使用してください")
    end

    it "family_name_kanaが空だと登録できない事" do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it "family_name_kanaが半角だと登録できない事" do
      @user.family_name_kana = "ﾃｽﾄ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana 全角文字(カタカナ)を使用してください")
    end

    it "first_name_kanaが空だと登録できない事" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "first_name_kanaが半角だと登録できない事" do
      @user.first_name_kana = "ﾃｽﾄ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角文字(カタカナ)を使用してください")
    end

    it "birthdayが空だと登録できない事" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end

end