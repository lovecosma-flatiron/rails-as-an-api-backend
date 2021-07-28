class CreateParks < ActiveRecord::Migration[6.1]
  def change
    create_table :parks do |t|
      t.string :states
      t.string :parkCode
      t.string :designation
      t.string :fullName
      t.string :url
      t.string :name

      t.timestamps
    end
  end
end
