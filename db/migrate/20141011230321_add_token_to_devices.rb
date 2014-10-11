class AddTokenToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :token, :string
  end
end
