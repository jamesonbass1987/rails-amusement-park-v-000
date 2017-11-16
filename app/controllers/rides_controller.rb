class RidesController < ApplicationController

  def create
    new_ride = Ride.new(user_id: params[:ride][:user_id], attraction_id: params[:ride][:attraction_id])
    @response = new_ride.take_ride
    redirect_to user_path(current_user), flash: {notice: @response}
  end

end
