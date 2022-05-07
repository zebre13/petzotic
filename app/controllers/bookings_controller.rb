class BookingsController < ApplicationController
  def new
    @user = current_user
    @pet = Pet.find(params[:id])
    @booking = Booking.new
    authorize @pet
    authorize @user
    authorize @booking
  end

  def create
    @user = current_user
    @pet = Pet.find(params[:id])
    @booking = Booking.new(params[booking_params])
    @booking.pet = @pet
    @booking.user = @user
    authorize @user
    authorize @pet
    authorize @booking
    if @booking.save
      redirect_to user_path(@user)
    else
      render :pet
    end
  end

  def destroy
    @booking = Restaurant.find(params[:id])
    @booking.destroy
    authorize @booking
    redirect_to user_path(@user)
  end

  def booking_params
    params.require(:booking).permit(:confirmed, :starting_date, :ending_date)
  end
end
