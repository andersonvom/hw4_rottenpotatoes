require 'spec_helper'

describe MoviesController do

  it "GET 'similar'" do
    movie = mock_model('Movie')
    get :similar, :id => movie.id
    response.should be_success
  end

end
