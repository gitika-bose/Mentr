class CreateJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :mentors, :subjects do |t|
      t.index :mentor_id
      t.index :subject_id
    end
  end
end
