class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def edit
   @user = User.find(params[:id])
  end
  
  def update
       @user = User.find_by_id(params[:id])
     if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
     else
      render :edit      
     end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
