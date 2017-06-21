class CreatePowers < ActiveRecord::Migration[5.0]
  def change
    create_table :powers do |t|
      t.string :updated
      t.boolean :status

      t.timestamps null: false
    end
  end
end
