class CreateTableWordsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :table_words do |t|
      t.string :name
      t.references :table, foreign_key: true
      
      t.timestamps
    end
  end
end
