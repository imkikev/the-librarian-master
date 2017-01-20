class Author < ActiveRecord::Base

	has_many :book_authors
  has_many :books, through: :book_authors  
  searchkick word_start: [:name]
	after_commit :reindex_author

  def reindex_author
    self.reindex 
  end

end
