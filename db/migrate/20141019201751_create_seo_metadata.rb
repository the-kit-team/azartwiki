class CreateSeoMetadata < ActiveRecord::Migration
  def change
    create_table :seo_metadata do |t|
      t.belongs_to :wiki, index: true, null: false
      t.string :keywords
      t.string :description

      t.timestamps null: false
    end
  end
end
