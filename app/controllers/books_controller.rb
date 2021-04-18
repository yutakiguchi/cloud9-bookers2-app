class BooksController < ApplicationController
def index
  @user=current_user
  @books=Book.all
  @book=Book.new
end

def show
  @book=Book.new
  @books=Book.find(params[:id])
  @user=@books.user
end  

def create
  @book=Book.new(book_params)
  @book.user_id=current_user.id
  if @book.save
    flash[:notice]="successfully"
  redirect_to book_path(@book)
else
  @user=current_user
  @books=Book.all
  render :index
end
end


  

def edit
  @book=Book.find(params[:id])
end

def update
  @book=Book.find(params[:id])
  @book.user_id=current_user.id
   if @book.update(book_params)
     flash[:notice]="successfully"
  redirect_to book_path(@book.id)
else
  render :edit
end
end

def destroy
  @book=Book.find(params[:id])
  @book.user_id=current_user
  @book.destroy
  redirect_to books_path
end
def book_params
  params.require(:book).permit(:title,:body)
end
end
