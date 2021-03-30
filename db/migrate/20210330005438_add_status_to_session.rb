class AddStatusToSession < ActiveRecord::Migration[6.1]
  def change
    add_column :sessions, :status, :integer
  end
end
