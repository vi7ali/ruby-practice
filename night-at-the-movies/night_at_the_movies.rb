=begin
puts "What would you like to do?"
puts "-- Type 'add' to add a movie."
puts "-- Type 'update' to update a movie."
puts "-- Type 'display' to display all movies."
puts "-- Type 'delete' to delete a movie."
=end

puts "What should we do?"
puts "Add"
puts "Update"
puts "Display"
puts "Delete"

movies = {
  Terminator: 10,
  Fight_Club: 10,
  Bamby: 5
}

decision = gets.chomp!.downcase
case decision
when "add"
  puts "What movie would you like to add?"
  movie = gets.chomp!
  if movies[movie.to_sym].nil?
    puts "And what will be the rating from 1 to 10?"
    movies[movie.to_sym] = gets.chomp!.to_i
  else
    puts "This movie is already in the db"
  end
when "update"
  puts "Enter the movie you want to update from the list below"
  movies.each {|movie, score| puts "#{movie}: #{score}"}
  movie = gets.chomp
  unless movies[movie.to_sym].nil?
    puts "Enter the new score for the #{movie}"
    movies[movie.to_sym] = gets.chomp.to_i
  else
    puts "#{movie} is not found"
  end
when "display"
  movies.each {|movie, score| puts "#{movie}: #{score}"}
when "delete"
  puts "Enter the movie name to delete"
  movie = gets.chomp
  unless movies[movie.to_sym].nil?
    movies.delete(movie.to_sym)
  else
    puts "Movie not found"
  end
end


