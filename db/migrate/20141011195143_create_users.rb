class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false, index: true
      t.string :password_digest, null: false
      t.string :role, null: false, index: true, default: 'Role::Guest'
    end
  end
end
