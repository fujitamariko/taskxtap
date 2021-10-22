require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do

  describe 'ユーザー登録のテスト' do
    context 'ユーザー登録操作をした場合' do
      it 'ユーザーの新規登録ができること' do
      visit new_user_registration_path
      fill_in 'user[name]', with: 'new_user'
      fill_in 'user[email]', with: 'new@gmail.com'
      fill_in 'user[specification]', with: 'newuser0'
      fill_in 'user[birthday]', with: '002010-01-01'
      fill_in 'user[password]', with: 'newuser'
      fill_in 'user[password_confirmation]', with: 'newuser'
      click_button 'アカウント登録'
      expect(page).to have_content 'new_user'
      end
    end
    context 'ユーザーがログインしていない場合' do
      it 'グループ作成画面に飛ぼうとした時、ログイン画面に推移すること' do
      visit new_group_path
      expect(page).to have_content 'ログイン'
      end
    end
  end



  describe 'ログイン機能のテスト' do
    context '登録済のユーザーがログイン画面で正しい入力をした場合' do
      before do
        FactoryBot.create(:user1)
      end
      it 'ログインに成功し、マイページに遷移すること' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'user1@gmail.com'
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content 'マイページ'
      end
    end
    context 'ユーザーがログインしている場合' do
      before do
        @user1 = FactoryBot.create(:user1)
        @user2 = FactoryBot.create(:user2)
        visit new_user_session_path
        fill_in 'user[email]', with: 'user1@gmail.com'
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
      end
      it 'ログアウトができること' do
        click_link 'ログアウト'
        expect(page).to have_content 'ログアウトしました'
      end
      it '他人のマイページに飛ぼうとすると、自分のマイページに遷移すること' do
        visit user_path(@user2)
        expect(page).to have_content 'user1'
      end
    end
  end

  describe 'ユーザー編集機能' do
    context 'ユーザーが編集操作をした場合' do
      before do
        @user1 = FactoryBot.create(:user1)
        visit new_user_session_path
        fill_in 'user[email]', with: 'user1@gmail.com'
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
      end
      it 'ユーザー情報の編集・更新ができ、マイページへ遷移すること' do
        click_link 'ユーザー編集'
        fill_in 'user[name]', with: 'user_edit'
        fill_in 'user[current_password]', with: 'password'
        click_on '更新'
        expect(page).to have_content 'user_editのマイページ'
      end
    end
  end

  describe 'ユーザー削除機能' do
    context 'ユーザーがアカウント削除操作をした場合' do
      before do
        @user1 = FactoryBot.create(:user1)
        visit new_user_session_path
        fill_in 'user[email]', with: 'user1@gmail.com'
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
      end
      it 'アカウントが削除できること' do
        click_link 'ユーザー編集'
        click_on 'アカウント削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'アカウントを削除しました'
      end
    end
  end

  describe 'ゲストログイン機能' do
    context '管理者ゲストログインをした場合' do
      it 'ログインができ、マイページに遷移する' do
        visit root_path
        click_link '管理者ゲストログイン'
        expect(page).to have_content '管理者ゲストのマイページ'
      end
    end
    context 'ゲストログインをした場合' do
      it 'ログインができ、マイページに遷移する' do
        visit root_path
        click_on 'ゲストログイン'
        expect(page).to have_content 'ゲストのマイページ'
      end
    end
  end
end