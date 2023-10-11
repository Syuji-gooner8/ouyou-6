class UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :ensure_current_user, {only:[:update, :edit, :destroy]}

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def index
    @users = User.all
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to "/users/#{current_user.id}"
    else
      flash[:notice] = "errors"
      render :edit
    end
  end

  private


  def ensure_current_user
        @user = User.find(params[:id])
     if @user.id != current_user.id
        redirect_to user_path(current_user.id)
     end
  end

  def book_params
        params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
