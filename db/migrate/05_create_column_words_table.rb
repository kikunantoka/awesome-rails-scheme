class CreateColumnWordsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :column_words do |t|
      t.string :name
      t.references :column, foreign_key: true
      
      t.timestamps
    end
  end
end
