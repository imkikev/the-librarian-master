# == Schema Information
#
# Table name: books
#
#  id               :integer          not null, primary key
#  title            :string(255)      not null
#  original_title   :string(255)
#  translation      :string(255)
#  edition          :integer
#  edition_date     :date
#  edition_place    :string(255)
#  publication_year :integer
#  isbn             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Book < ActiveRecord::Base
  
  after_commit :reindex_books

  self.per_page = 5

  belongs_to :editorial
  has_many :book_authors
  has_many :authors, through: :book_authors  
  
  validates :title, :editorial_id, :author_ids, :presence => true
  validates :edition, :publication_year, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  
  mount_uploader :cover_pic, BookCoverUploader

  searchkick word_start: [:title, :original_title]

  def get_author
    return nil  unless self.book_authors.count>0
    return self.authors.first.name unless self.authors.count>1
    return self.authors.map{|f| "#{f.name}"}.*", "
  end

  def reindex_books    
    self.reindex 
  end
  
end
