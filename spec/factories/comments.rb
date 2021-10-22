FactoryBot.define do
  factory :comment do
    user { nil }
    task { nil }
    content { 'test' }
  end
end
