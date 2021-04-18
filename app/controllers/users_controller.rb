class UsersController < ApplicationController
  def show
    @book=Book.new
    @user=User.find(params[:id])
    @books=@user.books
  end

  def index
    @users=User.all
    @book=Book.new
    @user=current_user
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="successfully"
    redirect_to user_path(@user.id)
  else
    render :edit
  end
end

 def user_params
   params.require(:user).permit(:name,:introduction,:profile_image)
 end
end
