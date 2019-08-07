class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.integer :contact_tipology_id
      t.string :val
      t.boolean :principal

      t.timestamps
    end
  end
end
