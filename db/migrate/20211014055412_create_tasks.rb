class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :assortment, null: false
      t.string :major_category, null: false
      t.string :medium_category, null: false
      t.string :sub_category, null: false
      t.text :content, null: false
      t.decimal :plan_hours, null: false, precision: 5, scale: 2
      t.decimal :spend_hours, precision: 5, scale: 2
      t.date :deadline_on, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
