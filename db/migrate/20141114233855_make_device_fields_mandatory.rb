class MakeDeviceFieldsMandatory < ActiveRecord::Migration
  def change
    change_column_null :devices, :name, false
    change_column_null :devices, :uid, false
    change_column_null :devices, :token, false
    change_column_null :devices, :update_period, false
  end
end
