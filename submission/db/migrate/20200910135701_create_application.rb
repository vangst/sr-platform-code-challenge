class CreateApplication < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.references :position, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
