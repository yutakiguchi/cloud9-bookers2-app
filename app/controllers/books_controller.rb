class BooksController < ApplicationController
def index
  @books=Book.all
  @book=Book.new
  
end 

def create
  @book=Book.new(params_book)
  @book.user_id=current_user_id
  @book=Book.save
  redirect_to books_path
end  

def show
end 
def edit
  @book=Book.find(book_params)
end  

def update
end 

def destroy
end  
def book_params
  params.require(:book).permit(:title,:body)
end
end
