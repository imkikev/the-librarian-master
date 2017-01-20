class BooksController < ApplicationController
  respond_to :html
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @search = params[:search] || ''
    if !params[:search].present?
      @books = Book.includes(:authors, :editorial).order("created_at").paginate(:page => params[:page])
    else  
      @books = Book.search @search.to_s, includes: [:authors, :editorial],  page: params[:page]
    end  
    
  end

  def show
    respond_with(@book)
  end

  def new
    @book = Book.new    
    respond_with(@book)
  end

  def edit
  end

  def create    
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save 
        format.html { redirect_to book_path(@book), notice: 'Libro creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @book.update(book_params)
    respond_with(@book)
  end

  def destroy
    @book.destroy
    respond_with(@book)
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :editorial_id, :original_title, :translation, :edition, :edition_date, :edition_place, :publication_year, :isbn, :cover_pic, :author_ids => [])
    end
end
