class ReportsController < ApplicationController
  skip_before_filter :user_logged_in?, :only => :create
  skip_before_filter :verify_authenticity_token, :only => :create

  def create
    dev = Device.find(new_report_params[:device_id])
    unless dev.nil?
      if dev.token == new_report_params[:token]
        Report.create(new_report_params)
        response_body = {:update_period=>dev.update_period}
        head :created, response_body
      end
    else
      head :bad_request
    end


  end

  private #quite a lot of potential params!
  def new_report_params
    params.permit(:device_id,:token,:temperature,:pressure,:humidity,:wind_speed,:wind_direction,:rainfall,:light_level,:battery_level,:record_time)
  end

end
