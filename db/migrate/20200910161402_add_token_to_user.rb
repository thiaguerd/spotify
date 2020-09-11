class AddTokenToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :token, null: false, foreign_key: true
  end
end
