require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
    let!(:user) { FactoryBot.create(:user1) }
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    let!(:task1) { FactoryBot.create(:task1, user: user) }
    let!(:task2) { FactoryBot.create(:task2, user: user) }


  describe 'タスク新規作成機能' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'user1@email.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
    end
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do

      # 1. 新規作成ページに遷移する
      visit new_task_path

      # 2. 新規登録内容を入力する
      fill_in 'task[assortment]', with: 'test_assortment'
      fill_in 'task[major_category]', with: 'test_major_category'
      fill_in 'task[medium_category]', with: 'test_medium_category'
      fill_in 'task[sub_category]', with: 'test_sub_category'
      fill_in 'task[content]', with: 'test_content'
      fill_in 'task[plan_hours]', with: '45.5'
      fill_in 'task[spend_hours]', with: '500'
      select '2021', from: 'task_deadline_on_1i'
      select '10', from: 'task_deadline_on_2i'
      select '30', from: 'task_deadline_on_3i'
      select '完了', from: 'task_status'

      # 3. 「登録する」というvalue（表記文字）のあるボタンをクリックする
      click_button '送信ボタン'

      # 4. clickで登録されたはずの情報が、タスク一覧ページに表示されているかを確認する
      expect(page).to have_content 'test_medium_category'
      expect(page).to have_content 'test_content'
      expect(page).to have_content '2021'
      expect(page).to have_content '10'
      expect(page).to have_content '30'
      expect(page).to have_content '完了'
      end
    end
  end

  describe '一覧表示機能' do
    before do
        visit new_user_session_path
        fill_in 'user[email]', with: 'user1@email.com'
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
    end
    context 'タスク一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        visit tasks_path
        expect(page).to have_content 'test_content1'
      end
    end
  end

  describe '詳細表示機能' do
    before do
        visit new_user_session_path
        fill_in 'user[email]', with: 'user1@email.com'
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
    end
    context '任意のタスク詳細画面に遷移した場合' do
        it '該当タスクの内容が表示される' do
            visit task_path(task1.id)
            expect(page).to have_content 'test_assortment1'
        end
     end
  end

  describe '編集表示機能' do
    before do
        visit new_user_session_path
        fill_in 'user[email]', with: 'user1@email.com'
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
    end
    context '任意のタスク編集画面に遷移した場合' do
        it '該当タスクの編集画面が表示される' do
            visit task_path(task1.id)
            click_on 'Edit'
            expect(page).to have_content '種類'
        end
     end
  end

  describe '検索機能' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'user1@email.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
    end
    context '中分類であいまい検索をした場合' do
      it "検索キーワードを含むタスクで絞り込まれる" do
        visit tasks_path
        fill_in "中分類", with: 'test_medium_category'
        click_button '検索'
        expect(page).to have_content 'test_medium_category'
      end
    end

    context '小分類であいまい検索をした場合' do
      it "検索キーワードを含むタスクで絞り込まれる" do
        visit tasks_path
        fill_in "小分類", with: 'test_sub_category'
        click_button '検索'
        expect(page).to have_content 'test_sub_category'
      end
    end

    context '内容であいまい検索をした場合' do
      it "検索キーワードを含むタスクで絞り込まれる" do
        visit tasks_path
        fill_in "内容", with: 'test_content'
        click_button '検索'
        expect(page).to have_content 'test_content'
      end
    end
  end
end