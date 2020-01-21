class CreateQuizRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :quiz_records do |t|
      t.string :q0, limit: 1
      t.string :q1, limit: 1
      t.string :q2, limit: 1
      t.string :q3, limit: 1
      t.string :q4, limit: 1

      t.timestamps
    end
  end
end
