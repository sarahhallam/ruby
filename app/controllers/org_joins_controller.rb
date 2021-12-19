class OrgJoinsController < ApplicationController
  # allows only logged in users
  before_action :require_user_logged_in!

  def edit; end
  def update # update user organization
    @org = Organization.find_by(company: params[:user][:company])

    if params[:user][:company] != "" #if input field not empty continue, else end

      #if org exists in database and update successful continue, else, end
      if Organization.find_by(:company => params[:user][:company]) != nil && Current.user.update(:organization => @org)
        @shifts = Current.user.shifts
        @shifts.destroy_all
        redirect_to root_path, notice: 'org updated'
      else
        redirect_to org_join_path, notice: 'No record of that organization. Please input an existing organization.'
      end
    else
      redirect_to org_join_path, notice: 'please fill out all fields'
      #render :edit
    end
  end
  private
  def password_params
    params.require(:user).permit(:organization)
  end
end
