require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    movies = [{:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992', :director => 'Da'},
        	  {:title => 'The Terminator', :rating => 'R', :release_date => '26-Oct-1984', :director => 'Da'},
        	  {:title => 'When Harry Met Sally', :rating => 'R', :release_date => '21-Jul-1989', :director => 'Dbb'},
          	  {:title => 'The Help', :rating => 'PG-13', :release_date => '10-Aug-2011'},
          	  {:title => 'Chocolat', :rating => 'PG-13', :release_date => '5-Jan-2001', :director => 'Dbb'},
          	  {:title => 'Amelie', :rating => 'R', :release_date => '25-Apr-2001', :director => ''}]
    
    context 'when the specified movie has a director' do
        it 'should call Movie.with_director' do
            movies.each do |movie|
                Movie.create!(movie)
            end
            get :similar, {id: Movie.find_by(title: 'Aladdin').id}
            expect(response).to render_template("similar")
        end
    end
    
    context 'when the specified movie has no director' do
        it 'should redirect to index page' do
            get :similar, {id: Movie.find_by(title: 'Amelie').id}
            expect(response).to redirect_to :movies
        end
    end
end
