require 'rails_helper'

RSpec.describe 'Commentモデル機能', type: :model do
  describe 'バリデーションのテスト' do

    context 'コメント内容が空の場合' do
      it 'バリデーションに引っかかる' do
        comment = FactoryBot.build(:comment, content: nil)
        expect(comment).not_to be_valid
      end
    end
    context 'コメント内容の文字数が256文字以上の場合' do
      it 'バリデーションに引っかかる' do
        comment = FactoryBot.build(:comment, content: 'a'*256)
        expect(comment).not_to be_valid
      end
    end
  end
end
