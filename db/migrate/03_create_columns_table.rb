class CreateColumnsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :columns do |t|
      t.string :name
      t.string :type
      t.references :repository, foreign_key: true
      
      t.timestamps
    end
  end
end
