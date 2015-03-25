class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update]
  before_action :authorize_user!, only: [:edit, :update]
  
  respond_to :html, :js
  
  def index
    skill_ids = params[:skill_ids]
    page = params[:page]
    user_ids = UserSkill.user_ids_having_required_skills(skill_ids)
    @users = User.where(id: user_ids).paginate(page: page)
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
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile was updated!'
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password, :name, :surname)
  end
end
