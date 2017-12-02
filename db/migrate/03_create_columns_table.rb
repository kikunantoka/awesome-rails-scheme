class CreateColumnsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :columns do |t|
      t.string :name
      t.string :data_type
      t.references :table, foreign_key: true
      
      t.timestamps
    end
  end
end
