require 'spec_helper'

describe MoviesController do

  context "'similar' action" do

    before :each do
      @movie = mock_model('Movie', :director => 'George Lucas')
    end

    it "GET 'similar'" do
      get :similar, :id => @movie.id
      response.should render_template('similar')
    end
    
    it "should find all movies from the director of given movie" do
      get :similar, :id => @movie.id
      Movie.should_receive(:find_by_director).with('George Lucas')
    end
  
  end

end
