require 'rails_helper'
RSpec.describe 'ラベル管理機能', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:task1) { FactoryBot.create(:task1, user: user) }
  let!(:lebel) { FactoryBot.create(:label) }
  let!(:lebel2) { FactoryBot.create(:label2) }

  describe 'ラベル登録機能' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'user1@email.com'
      fill_in 'user[password]', with:'password'
      click_button 'ログイン'
      visit new_task_path
    end
    context 'タスクを新規作成時、ラベルを選択した場合' do
      it 'ラベルが登録される' do
        visit new_task_path
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
        find('#task_status').all('option')[1].select_option
        check 'name1'
        click_on '送信ボタン'
        expect(page).to have_content 'name1'
      end
    end
    context 'ラベルを複数登録した場合' do
      it '複数のラベルが登録される' do
        visit new_task_path
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
        find('#task_status').all('option')[1].select_option
        check 'name1'
        check 'name2'
        click_on '送信ボタン'
        expect(page).to have_content 'name1'
        expect(page).to have_content 'name2'
      end
    end
  end

  describe 'ラベル編集機能' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'user1@email.com'
      fill_in 'user[password]', with:'password'
      click_button 'ログイン'
    end
    context 'タスク編集時にラベルの選択を変更した場合' do
      it '変更したラベルに変わる' do
        visit task_path(task1.id)
        click_on 'Edit'
        check 'name1'
        check 'name2'
        click_on '送信ボタン'
        expect(page).to have_content 'name1'
        expect(page).to have_content 'name2'
      end
    end
  end

  describe 'ラベル詳細表示機能' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'user1@email.com'
      fill_in 'user[password]', with:'password'
      click_button 'ログイン'
    end
    context 'ラベルを登録した場合' do
      it '詳細画面で登録したラベル一覧が表示される' do
        visit task_path(task1.id)
        click_on 'Edit'
        check 'name1'
        check 'name2'
        click_on '送信ボタン'
        click_on '詳細'
        expect(page).to have_content 'name1'
        expect(page).to have_content 'name2'
      end
    end
  end

end