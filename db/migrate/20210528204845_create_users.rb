class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :firstname, null: false
      t.string :lastname
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.timestamps
    end
  end
end
