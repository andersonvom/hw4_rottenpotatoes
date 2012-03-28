require 'spec_helper'

describe MoviesController do

  it "should be able to sort movies by title" do
    get :index, :sort => 'title'
    assigns(:title_header).should == 'hilite'
  end

  it "should be able to sort movies by release date" do
    get :index, :sort => 'release_date'
    assigns(:date_header).should == 'hilite'
  end

  it "should filter movies of selected ratings" do
    ratings = {'G'=>'1'}
    get :index, :ratings => ratings, :sort => 'title'
    assigns(:selected_ratings).should == ratings
  end
  
  it "should create new movies" do
    movie_params = {"movie"=>{"title"=>"Temp", "rating"=>"G", "release_date(1i)"=>"2012", "release_date(2i)"=>"3", "release_date(3i)"=>"28"}, "commit"=>"Save Changes"}
    post :create, movie_params
    assigns(:movie).id.should_not be_blank
  end
  
  it "should be able to delete movies" do
    movie = mock_model('Movie')
    Movie.should_receive(:find).with('3').and_return(movie)
    movie.should_receive(:destroy)
    delete :destroy, :id => '3'
  end

  describe "#similar action" do

    before :each do
      @movie = mock_model('Movie', :director => 'George Lucas')
      @fake_results = [mock_model('Movie'), mock_model('Movie')]
      Movie.stub(:find).and_return @movie
    end

    it "GET 'similar'" do
      Movie.stub(:find_all_by_director)
      get :similar, :id => @movie.id
      response.should render_template('similar')
    end
    
    it "should find all movies from the director of given movie" do
      Movie.should_receive(:find_all_by_director).with('George Lucas').
        and_return(@fake_results)
      get :similar, :id => @movie.id
      assigns(:movies).should == @fake_results
    end
    
    it "should redirect to home page if movie has no director" do
      movie_without_director = mock_model('Movie')
      Movie.stub(:find).and_return movie_without_director
      get :similar, :id => movie_without_director.id
      response.should be_redirect
    end
  
  end

end
