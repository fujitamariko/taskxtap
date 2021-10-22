require 'rails_helper'

RSpec.describe 'Userモデル機能', type: :model do
  describe 'バリデーションのテスト' do

    context '名前/メールアドレスパスワード/確認用パスワードが入力された場合' do
      it "バリデーションが通る" do
        user = FactoryBot.build(:user1)
        expect(user).to be_valid
      end
    end
    context '名前が空の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user1, name: nil)
        expect(user).not_to be_valid
      end
    end
    context '名前が20文字以上の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user1, name: 'n'*21)
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが空の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user1, email: nil)
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが6文字未満の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user1, password: '12345')
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが20文字以上の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user1, password: 'p'*21)
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが空の場合' do
      it "バリデーションに引っかかる" do
        user = FactoryBot.build(:user1, email: nil)
        expect(user).not_to be_valid
      end
    end
    context '登録済みのメールアドレスを入力した場合' do
      it "バリデーションに引っかかる" do
        user = FactoryBot.create(:user1, email: 'aaa@test.com')
        repeat_user = FactoryBot.build(:user1, email: 'aaa@test.com')
        expect(repeat_user).not_to be_valid
      end
    end
    context 'メールアドレスのフォーマットが不正な場合' do
      it 'バリデーションが引っかかる' do
        user = FactoryBot.build(:user1, email: 'aaa.test.com')
        expect(user).not_to be_valid
      end
    end

  end
end
