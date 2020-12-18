class Changedefaultinsessionidinusers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :session_id, :string, :default => "0"
  end
end
