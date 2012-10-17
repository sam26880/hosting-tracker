class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.date :expiration_date
      t.text :notes

      t.timestamps
    end
  end
end
