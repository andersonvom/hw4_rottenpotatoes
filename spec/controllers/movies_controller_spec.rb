require 'spec_helper'

describe MoviesController do

  context "'similar' action" do

    before :each do
      @movie = mock_model('Movie', :director => 'George Lucas')
      @fake_results = [mock_model('Movie'), mock_model('Movie')]
      Movie.stub(:find).and_return @movie
    end

    it "GET 'similar'" do
      Movie.stub(:find_by_director)
      get :similar, :id => @movie.id
      response.should render_template('similar')
    end
    
    it "should find all movies from the director of given movie" do
      Movie.should_receive(:find_by_director).with('George Lucas').
        and_return(@fake_results)
      get :similar, :id => @movie.id
      assigns(:movies).should == @fake_results
    end
  
  end

end
