Rails.application.routes.draw do
  root 'users#new'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
