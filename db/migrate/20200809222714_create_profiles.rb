class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.string :first_name
      t.string :second_name
      t.integer :age
      
      t.timestamps
    end
  end
end
