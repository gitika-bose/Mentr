class CreateMentors < ActiveRecord::Migration[6.1]
  def change
    create_table :mentors do |t|
      t.belongs_to :user, index: { unique: true }

      t.timestamps
    end
  end
end
