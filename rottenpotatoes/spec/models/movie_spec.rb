require 'rails_helper'

RSpec.describe Movie, type: :model do
    movies = [{:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992', :director => 'Da'},
        	  {:title => 'The Terminator', :rating => 'R', :release_date => '26-Oct-1984', :director => 'Da'},
        	  {:title => 'When Harry Met Sally', :rating => 'R', :release_date => '21-Jul-1989', :director => 'Dbb'},
          	  {:title => 'The Help', :rating => 'PG-13', :release_date => '10-Aug-2011'},
          	  {:title => 'Chocolat', :rating => 'PG-13', :release_date => '5-Jan-2001', :director => 'Dbb'},
          	  {:title => 'Amelie', :rating => 'R', :release_date => '25-Apr-2001', :director => ''}]
    context 'with a given director' do
        it 'should return the correct matches for movies by the same director' do
            movies.each do |movie|
                Movie.create!(movie)
            end
            expect(Movie.with_director('Da').map { |movie| {:title => movie[:title]} }).to include(*movies[0..1].map { |movie| {:title => movie[:title]} })
        end
      
        it 'should not return matches of movies by different directors' do
            expect(Movie.with_director('Da').map {|movie| {:title => movie[:title]} }).not_to include(*movies[2..].map { |movie| {:title => movie[:title]} })
        end
    end
end
