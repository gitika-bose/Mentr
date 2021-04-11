class AddInitialSubjects < ActiveRecord::Migration[6.1]
  def up
    subjects = ["Computer Science", "Finance", "Probability", "Statistics", "Networking"]
    subjects.each do |name|
      Subject.create(name: name)
    end
  end
 
  def down
    Subject.delete_all
  end
end
