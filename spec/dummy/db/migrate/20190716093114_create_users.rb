class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :surname
      t.string :email

      t.text :bio
      t.integer :category_id
      t.date :birthdate
      t.datetime :registration_datetime
      t.time :birttime


      t.timestamps
    end
  end
end
