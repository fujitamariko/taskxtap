require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do

  describe 'ユーザー登録のテスト' do
    context 'ユーザー登録操作をした場合' do
      it 'ユーザーの新規登録ができること' do
      visit new_user_registration_path
      fill_in 'user[name]', with: 'new_user'
      fill_in 'user[email]', with: 'new@email.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_button 'アカウント登録'
      expect(page).to have_content 'アカウント登録が完了しました'
      end
    end
  end

  describe 'ログイン機能のテスト' do
    context '登録済のユーザーがログイン画面で正しい入力をした場合' do
      before do
        FactoryBot.create(:user)
      end
      it 'ログインに成功し、マイページに遷移すること' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'user1@email.com'
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました'
      end
    end
    context 'ユーザーがログインしている場合' do
      before do
        @user = FactoryBot.create(:user)
        @user2 = FactoryBot.create(:user2)
        visit new_user_session_path
        fill_in 'user[email]', with: 'user1@email.com'
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
      end
      it 'ログアウトができること' do
        # ヘッダーのハンバーガーボタンをさす
        find('.navbar-toggle').native.click
        click_link 'ログアウト'
        expect(page).to have_content 'ログアウトしました'
      end
      it '他人のマイページに飛ぼうとすると、自分のマイページに遷移すること' do
        visit user_path(@user2)
        expect(page).to have_content '他の人のページへアクセスは出来ません'
      end
    end
  end

  describe 'ユーザー編集機能' do
    context 'ユーザーが編集操作をした場合' do
      before do
        @user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'user[email]', with: 'user1@email.com'
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
      end
      it 'ユーザー情報の編集・更新ができ、マイページへ遷移すること' do
        # ヘッダーのハンバーガーボタンをさす
        find('.navbar-toggle').native.click
        click_link 'マイページ'
        click_link 'ユーザー情報を編集する'
        fill_in 'user[email]', with: 'user1@email.com'
        fill_in 'user[current_password]', with: 'password'
        click_on '更新'
        expect(page).to have_content 'アカウント情報を変更しました'
      end
    end
  end

  describe 'ユーザー削除機能' do
    context 'ユーザーがアカウント削除操作をした場合' do
      before do
        @user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'user[email]', with: 'user1@email.com'
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
      end
      it 'アカウントが削除できること' do
        # ヘッダーのハンバーガーボタンをさす
        find('.navbar-toggle').native.click
        click_link 'マイページ'
        click_on 'ユーザーを削除する'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'ユーザーを削除しました'
      end
    end
  end

  describe 'ゲストログイン機能' do
    context '管理者ゲストログインをした場合' do
      it 'ログインができ、マイページに遷移する' do
        visit root_path
        # ヘッダーのハンバーガーボタンをさす
        find('.navbar-toggle').native.click
        click_link '管理者ゲストログイン（確認用）'
        expect(page).to have_content '管理者ゲストユーザーとしてログインしました'
      end
    end
    context 'ゲストログインをした場合' do
      it 'ログインができ、マイページに遷移する' do
        visit root_path
        # ヘッダーのハンバーガーボタンをさす
        find('.navbar-toggle').native.click
        click_on 'ゲストログイン（閲覧用）'
        expect(page).to have_content 'ゲストユーザーとしてログインしました'
      end
    end
  end
end