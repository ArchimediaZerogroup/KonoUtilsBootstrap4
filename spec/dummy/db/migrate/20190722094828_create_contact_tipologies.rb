class CreateContactTipologies < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_tipologies do |t|
      t.string :name

      t.timestamps
    end
  end
end
