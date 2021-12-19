class BusinessesController < ApplicationController
    before_action :require_user_logged_in!
    skip_before_action :verify_authenticity_token
    # instantiates new user
    def new
      @organization = Organization.new
    end
    def create
      @organization = Organization.new(user_params)
      if @organization.save
        redirect_to root_path
      else
        redirect_to root_path, notice: 'please fill out all fields'
      end
    end
    private
    def user_params
      # strong parameters
      params.permit(:company, :rate)
    end
  end
