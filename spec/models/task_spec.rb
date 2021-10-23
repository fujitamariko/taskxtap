require 'rails_helper'

RSpec.describe 'Taskモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:user)
    end

    context '種類が空の場合' do
      it 'バリデーションに引っかかる' do
        task = FactoryBot.build(:task1, assortment: nil, user: @user)
        expect(task).not_to be_valid
      end
    end
    context '大分類が空の場合' do
      it 'バリデーションに引っかかる' do
        task = FactoryBot.build(:task1, major_category: nil, user: @user)
        expect(task).not_to be_valid
      end
    end
    context '中分類が空の場合' do
      it 'バリデーションに引っかかる' do
        task = FactoryBot.build(:task1, medium_category: nil, user: @user)
        expect(task).not_to be_valid
      end
    end
    context '小分類が空の場合' do
      it 'バリデーションに引っかかる' do
        task = FactoryBot.build(:task1, sub_category: nil, user: @user)
        expect(task).not_to be_valid
      end
    end
    context '内容が空の場合' do
      it 'バリデーションに引っかかる' do
        task = FactoryBot.build(:task1, content: nil, user: @user)
        expect(task).not_to be_valid
      end
    end
    context '予定工数が空の場合' do
      it 'バリデーションに引っかかる' do
        task = FactoryBot.build(:task1, plan_hours: nil, user: @user)
        expect(task).not_to be_valid
      end
    end
    context '予定工数が1000時間以上の場合' do
      it 'バリデーションに引っかかる' do
        task = FactoryBot.build(:task1, plan_hours: '11111', user: @user)
        expect(task).not_to be_valid
      end
    end
    context '実工数が1000時間以上の場合' do
      it 'バリデーションに引っかかる' do
        task = FactoryBot.build(:task1, spend_hours: '11111', user: @user)
        expect(task).not_to be_valid
      end
    end
    context '締め切りが1年以上昔の場合' do
      it 'バリデーションに引っかかる' do
        task = FactoryBot.build(:task1, deadline_on: '2011-12-09', user: @user)
        expect(task).not_to be_valid
      end
    end
    context 'ステータスが空の場合' do
      it 'バリデーションに引っかかる' do
        task = FactoryBot.build(:task1, status: nil, user: @user)
        expect(task).not_to be_valid
      end
    end
  end
end
