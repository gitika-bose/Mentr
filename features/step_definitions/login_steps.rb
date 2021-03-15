Given /the following users exists/ do |user_table|
    user_table.hashes.each do |user|
      movie = Movie.create(title: movie["title"], 
          rating: movie["rating"],
          description: movie["description"],
          release_date: movie["release_date"]  
        );
    end
end