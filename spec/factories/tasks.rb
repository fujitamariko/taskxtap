FactoryBot.define do
  factory :task1, class: Task do
    assortment { 'test_assortment1' }
    major_category { 'test_major_category1' }
    medium_category { 'test_medium_category1' }
    sub_category { 'test_sub_category1' }
    content { 'test_content1' }
    plan_hours { '150.15' }
    spend_hours { '111' }
    deadline_on { '2021/10/22' }
    status { '完了' }
  end

  factory :task2, class: Task do
    assortment { 'test_assortment2' }
    major_category { 'test_major_category2' }
    medium_category { 'test_medium_category2' }
    sub_category { 'test_sub_category2' }
    content { 'test_content2' }
    plan_hours { '222' }
    spend_hours { '245.2' }
    deadline_on { '2021/12/09' }
    status { '完了' }
  end
end