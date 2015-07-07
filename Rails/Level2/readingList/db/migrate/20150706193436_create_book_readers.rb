class CreateBookReaders < ActiveRecord::Migration
  def change
    create_table :book_readers do |t|
      t.references :book, index: true
      t.references :reader, index: true

      t.timestamps
    end
  end
end
