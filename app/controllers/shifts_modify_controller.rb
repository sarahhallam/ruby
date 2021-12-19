class ShiftsModifyController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @shift = Shift.new
  end

  def create

    @shift = Shift.new(user_params) #fix later
    @shift.user_id = Current.user.id

    if @shift.save!
      redirect_to shifts_modify_path, notice: 'Successfully added shift'
    else
      render :new
    end
  end

  def destroy
    @shift = Shift.find_by_id(params[:shift_id])
    if params[:shift_id] != nil
      @shift.destroy
      redirect_to shifts_modify_path, notice: 'shift deleted'
    else
      redirect_to shifts_modify_path, notice: 'shift failed'
    end
  end

  private
  def user_params
    # strong parameters
    params.require(:shift).permit(:start, :finish, :breaklength)

  end
end
