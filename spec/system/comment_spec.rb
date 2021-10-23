require 'rails_helper'
RSpec.describe 'コメント機能', type: :system do
    let(:user) { FactoryBot.create(:user) }
    let!(:task1) { FactoryBot.create(:task1, user: user) }

  describe 'コメント投稿・削除のテスト' do
    before do
        visit new_user_session_path
        fill_in 'user[email]', with: 'user1@email.com'
        fill_in 'user[password]', with:'password'
        click_button 'ログイン'
        visit task_path(task1.id)
    end
    context 'コメントを投稿した場合' do
      it '作成したコメントが表示される' do
        fill_in 'comment[content]', with: 'test'
        click_on '送信ボタン'
        expect(page).to have_content 'test'
      end
    end
    context 'コメントを入力せずに送信ボタンを押した場合' do
      it 'コメントは作成されない' do
        click_on '送信ボタン'
        expect(Comment.count).to eq 0
      end
    end
    context '削除ボタンを押した場合' do
      before do
        fill_in 'comment[content]', with: 'destroy_test'
        click_on '送信ボタン'
      end
      it 'コメントが削除される' do
        click_link 'コメント削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_no_content 'destroy_test'
      end
    end
  end

end