class CreateHumen < ActiveRecord::Migration
  def change
    create_table :humen do |t|
      t.string :name
      t.string :gender

      t.timestamps
    end
  end
end
