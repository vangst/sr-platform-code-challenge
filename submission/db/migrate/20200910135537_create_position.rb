class CreatePosition < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.string :description
      t.references :company, null: false, foreign_key: true
      t.integer :application_limit
      t.timestamps
    end
  end
end
