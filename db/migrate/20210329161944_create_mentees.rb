class CreateMentees < ActiveRecord::Migration[6.1]
  def change
    create_table :mentees do |t|
      t.belongs_to :user, index: { unique: true }

      t.timestamps
    end
  end
end
