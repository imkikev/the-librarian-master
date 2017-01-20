class AddCoverPicToBook < ActiveRecord::Migration
  def change
    add_column :books, :cover_pic, :string
  end
end
