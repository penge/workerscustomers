class UsersController < ApplicationController
  before_action :authenticate_user!, only: :index
  
  respond_to :html, :js
  
  def index
    skill_ids = params[:skill_ids]
    user_ids = UserSkill.where(skill_id: skill_ids).pluck(:user_id)
    @users = User.find(user_ids)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: 'Signed up!'
    else
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
