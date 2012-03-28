require 'spec_helper'

describe 'Routing for Movie' do

  before :each do
    @movie = Movie.create :title => 'Temp'
  end

  it "should have a named route to 'similar movies'" do
    { :get => 'movies/3/similar' }.
      should route_to(
        :controller => 'movies',
        :action => 'similar',
        :id => '3'
      )
  end

end
