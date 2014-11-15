class DevicesController < ApplicationController
	def view
	end
	def create
		d = Device.new(device_params)
		d.uid = session[:uid]
		d.reports_count = 0#assign the reports count
		unless d.save
			#error handling?
			flash[:errors] = d.errors.full_messages
			redirect_to new_device_path

		else
		redirect_to device_path(d.id)
	end
	end
	def new
		@device = Device.new
	end
	def edit
		@device = Device.find(params[:id])
	end
	def update
		dev = Device.find(params[:id])
		if !dev.update(device_params)
			flash[:update_errors] = dev.errors
			redirect_to edit_device_path
		end
		redirect_to device_path
	end


	def destroy
		Device.find(params[:id]).destroy!
		redirect_to devices_path
	end
	def index
		@devices = Device.where(uid: 2)#create a global array of all the devices belonging to the user
		if @devices.nil?
			render :text => "No devices."
		end
	end
	def show
		@device = Device.find(params[:id])
		@latest_report = Report.where(device_id:params[:id]).order(record_time: :desc).first


	end
	private
	def device_params
		params.require(:device).permit(:name,:description, :update_period,:token) #update_period is in seconds
	end



end
