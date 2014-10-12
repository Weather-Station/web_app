class ChangeNameOfDeviceIdColumnInReports < ActiveRecord::Migration
  def change
    rename_column :reports, :deviceID, :device_id
  end
end
