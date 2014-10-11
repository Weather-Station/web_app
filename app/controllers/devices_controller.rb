class DevicesController < ApplicationController
	def view
	end
	def create
	end
	def new
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
	end
	def index
		@devices = Device.where(uid: 2)#create a global array of all the devices belonging to the user
		if @devices.nil?
			render :text => "No devices."
		end
	end
	def show
		@device = Device.find(params[:id])
	end
	private
	def device_params
		params.require(:device).permit(:name,:description)
	end

end
