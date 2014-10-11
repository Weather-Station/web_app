class DevicesController < ApplicationController
	def view
	end
	def create
		d = Device.new(device_params)
		#we have to make sure that the token is unique
		begin
			d.token = SecureRandom.hex(5)
		end while !Device.find_by(token:d.token).nil?
		d.uid = session[:uid]
		d.reports_count = 0
		unless d.save
			#error handling?
			flash[:save_errors] = d.errors
		end
		flash[:newly_created] = true
		redirect_to device_path(d.id)
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
	end
	def index
		@devices = Device.where(uid: 2)#create a global array of all the devices belonging to the user
		if @devices.nil?
			render :text => "No devices."
		end
	end
	def show
		@token_show = flash[:newly_created]

		@device = Device.find(params[:id])
	end
	private
	def device_params
		params.require(:device).permit(:name,:description)
	end

end
