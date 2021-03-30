class AddDetailsToMentors < ActiveRecord::Migration[6.1]
  def change
    add_column :mentors, :profile, :string 
    add_column :mentors, :linkedin, :string
    add_column :mentors, :location, :string
    add_column :mentors, :website, :string
    add_column :mentors, :company, :string
  end
end
