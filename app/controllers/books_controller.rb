class BooksController < ApplicationController
  include ActionController::MimeResponds
  include ActionController::Cookies

  def index
    @books = Book.all
    @q = Book.ransack params[:q]
    @books = @q.result
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @books }
    end
  end

  def get
    @books = Book.all
    respond_to do |format|
      format.json { render :json => @books }
    end
  end
  # def new
  #   @book = Book.new
  # end

  def new
    @book = Book.new book_params
    if @book.save
      flash[:success] = "Create successfully"
      redirect_to root_url
    else
      flash.now[:failed] = "Create fail"
      render :new
    end
  end

  def show
    @book = Book.find_by code: params[:code]
    respond_to do |format|
      format.html# index.html.erb
      format.json { render :json => @book }
    end
  end

  def delete
    @book = Book.find_by code: params[:code]
    if @book.destroy
      flash[:success] = "Delete successfully"
    else
      flash[:failed] = "Delete fail"
    end
    respond_to do |format|
      format.html {redirect_to root_url}
      format.js
    end
  end

  def edit
    @book = Book.find_by code: params[:code]
    if @book.update edit_book_params
      flash[:success] = "Update successfully"
    else
      flash[:failed] = "Update fail"
    end
    respond_to do |format|
      format.html {redirect_to root_url}
      format.js
    end
  end

  private
  def book_params
    params.permit :id,:code, :name, :description
  end
  def edit_book_params
    params.permit :name, :description
  end
  def load_book
    @book = Book.find params[:id]
  end
end

