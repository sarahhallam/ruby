class OrgEditsController < ApplicationController
  def new; end
  def edit

    @org = Organization.where(company: params[:company])
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to org_update_path, alert: 'org edit error'
  end
  def update
    # update organization
    @org = Organization.where(company: params[:company])

    if params[:company] != "" && params[:newcompany] != "" && params[:rate] != ""
      if Organization.find_by(:company => params[:company]) != nil && @org.update(:company => params[:newcompany]) && @org.update(:rate => params[:rate])
        redirect_to org_update_path, notice: 'Reset successfull.'
      else
        redirect_to org_update_path, notice: 'No record of that organization. Please edit an existing organization that matches one below.'
      end
    else
      redirect_to org_update_path, notice: 'Please fill out all fields.'
    end
  end

  def leave
    @shifts = Current.user.shifts
    @shifts.destroy_all
    Current.user.update(organization: nil)
    redirect_to root_path, notice: 'You have left your Organization.'
  end

  private
  def password_params
    params.permit(:newcompany, :rate)
  end
end
