class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.references  :left, index: true, foreign_key: true
      t.references  :right, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
