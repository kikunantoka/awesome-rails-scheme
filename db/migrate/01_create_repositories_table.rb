class CreateRepositoriesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :repositories do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
