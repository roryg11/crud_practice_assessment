class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :name
      t.string :group
      t.integer :price
      t.timestamps
    end
  end
end
