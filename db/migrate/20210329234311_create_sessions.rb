class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.belongs_to :mentor
      t.belongs_to :mentee
      
      t.timestamps
    end
  end
end
