class AddEditorialToBook < ActiveRecord::Migration
  def change
    add_reference :books, :editorial, index: true
    remove_column :books, :editorial
  end
end
