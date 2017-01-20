class CreateBookAuthors < ActiveRecord::Migration
  def change
    create_table :book_authors do |t|
      t.references :book, index: true
      t.references :author, index: true

      t.timestamps
    end

    remove_column :books, :author
  end
end
