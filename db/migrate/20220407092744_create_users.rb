# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, unique: true
      t.string :address
      t.string :password_digest
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
