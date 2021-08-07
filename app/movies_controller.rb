# Replace the '__' in the below methods to to make the specs pass!
# Each '__' corresponds to a single line of code you will need to write.
# See the example below on the left and how it should look on the right.
# def make_a_new_movie_instance    # def make_a_new_movie_instance
#   movie = __                     #   movie = Movie.new
# end                              # end

def can_be_instantiated_and_then_saved
  movie = Movie.new()
  movie.title = "This is a title."
  movie.save
end

def can_be_created_with_a_hash_of_attributes
  # Initialize movie and then and save it
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  movie = Movie.new()
  movie.title = attributes[0]
  movie.release_date = attributes[1]
  movie.director = attributes[2]
  movie.lead = attributes[3]
  movie.in_theaters = attributes[4]
end

def can_be_created_in_a_block(arg = {title: "Home Alone", release_date: 1990})
  # If no arguments are passed, use default values:
  # title == "Home Alone"
  # release_date == 1990
  
  Movie.create do |m|
    m.title = arg[:title]
    m.release_date = arg[:release_date]
  end
end

def can_get_the_first_item_in_the_database
  Movie.first
end

def can_get_the_last_item_in_the_database
  Movie.last
end

def can_get_size_of_the_database
  Movie.count
end

def can_find_the_first_item_from_the_database_using_id
  Movie.find(1)
end

def can_find_by_multiple_attributes
  # Search Values:
  # title == "Title"
  # release_date == 2000
  # director == "Me"
  Movie.find_by(title: "Title", release_date: 2000, director: "Me")
end

def can_find_using_where_clause_and_be_sorted
  # For this test return all movies released after 2002 and ordered by 
  # release date descending
  Movie.all.select { | row | row.release_date > 2002 }.sort { |a, b| b <=> a }
end

def can_be_found_updated_and_saved
  # Updtate the title "Awesome Flick" to "Even Awesomer Flick", save it, then return it
  Movie.create(title: "Awesome Flick")
  update_film =  Movie.find_by(title: "Awesome Flick")
  update_film.title = "Even Awesomer Flick"
  update_film.save
end

def can_update_using_update_method
  # Update movie title to "Wat, huh?"
  Movie.create(title: "Wat?")
  Movie.find_by(title: "Wat?").update(title: "Wat, huh?")
end

def can_update_multiple_items_at_once
  # Change title of all movies to "A Movie"
  5.times do |i|
    Movie.create(title: "Movie_#{i}", release_date: 2000+i)
  end
  5.times do |i|
    Movie.find_by(title: "Movie_#{i}").update(title: "A Movie")
  end
end

def can_destroy_a_single_item
  Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  Movie.find_by(title: "That One Where the Guy Kicks Another Guy Once").destroy
end

def can_destroy_all_items_at_once
  10.times do |i|
    Movie.create(title: "Movie_#{i}").destroy
  end
end