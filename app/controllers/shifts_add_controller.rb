class ShiftsAddController < ApplicationController

  def new
    @shift = Shift.new
  end

  def create

    @shift = Shift.new(user_params)
    @shift.user_id = Current.user.id

    if @shift.save
      redirect_to shifts_add_path, notice: 'Successfully added shift'
    else
      flash.now[:alert] = 'please fill out all fields'
      render :new
    end
  end

  private
  def user_params
    # strong parameters
    params.require(:shift).permit(:start, :finish, :breaklength)

  end
end
