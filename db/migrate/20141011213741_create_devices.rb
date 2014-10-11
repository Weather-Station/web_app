class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.integer :uid
      t.integer :reports_count
      t.text :description

      t.timestamps
    end
  end
end
