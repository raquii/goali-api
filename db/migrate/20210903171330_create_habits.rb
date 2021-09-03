class CreateHabits < ActiveRecord::Migration[6.1]
  def change
    create_table :habits do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.string :icon
      t.string :periodicity
      t.integer :goal
      t.boolean :private
      t.boolean :archived

      t.timestamps
    end
  end
end
