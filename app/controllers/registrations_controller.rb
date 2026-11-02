class RegistrationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      org = Organization.create!(name: "#{@user.first_name}'s Organization", slug: "#{@user.first_name.parameterize}-org-#{SecureRandom.hex(4)}")
      Membership.create!(user: @user, organization: org, role: :owner)
      session[:user_id] = @user.id
      session[:organization_id] = org.id
      redirect_to root_path, notice: "Account created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
