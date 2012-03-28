require 'spec_helper'

describe 'Routing for Home Page' do

  it "should have a named route to 'similar movies'" do
    { :get => '/' }.
      should route_to(
        :controller => 'movies',
        :action => 'index',
      )
  end

end
