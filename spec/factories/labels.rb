FactoryBot.define do
  factory :label do
    name {'name1'}
  end

  factory :label2, class: Label do
    name {'name2'}
  end
end