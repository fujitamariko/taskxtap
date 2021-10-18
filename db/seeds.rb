# Label.create!(name: '優先度高')
# Label.create!(name: '優先度中')
# Label.create!(name: '優先度低')
# Label.create!(name: '本日中対応')
# Label.create!(name: '後日調整可')
# Label.create!(name: '要相談')
# Label.create!(name: 'メールする')
# Label.create!(name: '電話かける')
# Label.create!(name: '日程調整')
# Label.create!(name: '保留')

# User.create!(
#     name: 'test001',
#     email: 'test001@email.com',
#     password: '12345678',
#     admin: false
# )
# User.create!(
#     name: 'test002',
#     email: 'test002@email.com',
#     password: '12345678',
#     admin: false
# )
# User.create!(
#     name: 'test003',
#     email: 'test003@email.com',
#     password: '12345678',
#     admin: false
# )
# User.create!(
#     name: 'test004',
#     email: 'test004@email.com',
#     password: '12345678',
#     admin: false
# )
# User.create!(
#     name: 'test005',
#     email: 'test005@email.com',
#     password: '12345678',
#     admin: false
# )

# Task.create!(
#     user_id: 1,
#     assortment:'JOB',
#     major_category: '新卒採用',
#     medium_category: '23卒新卒採用',
#     sub_category: '母集団形成',
#     content: '群馬大合説',
#     plan_hours: '1.0',
#     spend_hours: '1.2',
#     deadline_on: '2021-10-30',
#     status: '着手中',
# )

# Task.create!(
#     user_id: 1,
#     assortment:'JOB',
#     major_category: '中途採用',
#     medium_category: '山田さん選考',
#     sub_category: '1次面接',
#     content: '日程調整',
#     plan_hours: '0.3',
#     spend_hours: '0.1',
#     deadline_on: '2021-09-01',
#     status: '未着手',
# )

# Task.create!(
#     user_id: 2,
#     assortment:'JOB',
#     major_category: '研修',
#     medium_category: 'キャリアデザイン研修',
#     sub_category: '事後対応',
#     content: 'アンケート配信',
#     plan_hours: '0.3',
#     spend_hours: '0.2',
#     deadline_on: '2021-11-30',
#     status: '完了',
# )

# Task.create!(
#     user_id: 2,
#     assortment:'JOB',
#     major_category: '採用',
#     medium_category: '22卒新卒採用',
#     sub_category: '内定者懇親会',
#     content: '会場手配',
#     plan_hours: '0.3',
#     spend_hours: '0.5',
#     deadline_on: '2021-11-05',
#     status: '着手中',
# )

# Task.create!(
#     user_id: 1,
#     assortment:'JOB',
#     major_category: '研修',
#     medium_category: '異文化コミュニケーション研修',
#     sub_category: '研修当日',
#     content: '出欠確認',
#     plan_hours: '0.1',
#     spend_hours: '0.1',
#     deadline_on: '2021-10-15',
#     status: '完了',
# )

Comment.create!(
    task_id: 2,
    user_id: 1,
    content: "資料着日確認"
)

Comment.create!(
    task_id: 3,
    user_id: 1,
    content: "18時以降なら電話可能"
)

Comment.create!(
    task_id: 4,
    user_id: 2,
    content: "研修終わる10分前に配信"
)

Comment.create!(
    task_id: 5,
    user_id: 2,
    content: "人数変更いつまで可能か確認"
)

Comment.create!(
    task_id: 6,
    user_id: 1,
    content: "名簿へ反映させる"
)