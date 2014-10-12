class AddUpdateFrequencyToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :update_period, :integer
  end
end
