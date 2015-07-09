class CreateWeapons < ActiveRecord::Migration
  def change
    create_table :weapons do |t|
      t.string :name
      t.references :zombie, index: true

      t.timestamps
    end
  end
end
