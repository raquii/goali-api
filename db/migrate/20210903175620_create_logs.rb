class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.belongs_to :habit, null: false, foreign_key: true
      t.date :date
    end
  end
end
