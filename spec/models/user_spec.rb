require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    let(:user) do
      User.new(nickname: 'aaa', email: 'test@example', password: 'aaa000', password_confirmation: 'aaa000', family_name: '山田',
               name: '太郎', kana_family_name: 'ヤマダ', kana_name: 'タロウ', birthday: '2000-01-01')
    end

    it 'nicknameが空では登録できない' do
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空だと登録できない' do
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it '重複したemailが存在する場合は登録できない' do
      user.save
      another_user = User.new(nickname: 'bbb', email: user.email, password: 'bbb111', password_confirmation: 'bbb111',
                              family_name: '佐藤', name: '次郎', kana_family_name: 'サトウ', kana_name: 'ジロウ', birthday: '1990-01-01')
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは@を含まないと登録できない' do
      user.email = 'testmail'
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが5文字以下では登録できない' do
      user.password = '12345'
      user.password_confirmation = '12345'
      user.valid?
      expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英数字混合でないと登録できない' do
      user.password = 'aaaaaa'
      user.password_confirmation = 'aaaaaa'
      user.valid?
      expect(user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')

      user.password = '111111'
      user.password_confirmation = '111111'
      user.valid?
      expect(user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      user.password_confirmation = 'aaa0000'
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'family_nameが空では登録できない' do
      user.family_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end

    it 'family_nameが全角でないと登録できない' do
      user.family_name = 'yamada'
      user.valid?
      expect(user.errors.full_messages).to include('Family name 全角文字を使用してください')
    end

    it 'nameが空では登録できない' do
      user.name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Name can't be blank")
    end

    it 'nameが全角でないと登録できない' do
      user.name = 'taro'
      user.valid?
      expect(user.errors.full_messages).to include('Name 全角文字を使用してください')
    end

    it 'kana_family_nameが空では登録できない' do
      user.kana_family_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Kana family name can't be blank")
    end

    it 'kana_family_nameが全角カタカナでないと登録できない' do
      user.kana_family_name = 'やまだ'
      user.valid?
      expect(user.errors.full_messages).to include('Kana family name 全角カタカナを使用してください')
    end

    it 'kana_nameが空では登録できない' do
      user.kana_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Kana name can't be blank")
    end

    it 'kana_nameが全角カタカナでないと登録できない' do
      user.kana_name = 'たろう'
      user.valid?
      expect(user.errors.full_messages).to include('Kana name 全角カタカナを使用してください')
    end

    it 'birthdayが空では登録できない' do
      user.birthday = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
