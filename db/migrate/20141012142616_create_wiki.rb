class CreateWiki < ActiveRecord::Migration
  def change
    create_table :wiki do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
