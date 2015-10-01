class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :code
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
