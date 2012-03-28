
Given /^the following movies exist:$/ do |table|
  table.hashes.each do |movie|
    Movie.create! movie
  end
end

Then /the director of "([^"]+)" should be "([^"]+)"/ do |movie_name, director_name|
  movie = Movie.find_by_title movie_name
  movie.director.should == director_name
end
