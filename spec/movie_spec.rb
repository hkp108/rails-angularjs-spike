require 'rails_helper'

RSpec.describe 'GET /movies', type: :request do
  it 'sends a list of movies' do
    Movie.create(title: 'hello')

    get "/api/movies", {}, { "Accept" => "application/json" }

    expect(response.status).to eq 200

    body = JSON.parse(response.body)
    movie_titles = body.map { |m| m["title"] }

    expect(movie_titles).to match_array(["hello"])
  end


end

RSpec.describe 'create movie', type: :request do
  it 'sends a list of movies' do
    expect(Movie.count).to eq(0)

    post "/api/movies", movie:{title: 'test'}
    expect(response.status).to eq 201

    expect(Movie.count).to eq(1)
  end
end

RSpec.describe 'SHOW movie/:id', type: :request do
  it 'sends movie' do
    movie_1 = Movie.create(title: 'test')
    movie_2 = Movie.create(title: 'taken')
    get "/api/movies/#{movie_1.id}", {}, { "Accept" => "application/json" }
    expect(response.status).to eq 200
    body = JSON.parse(response.body)
    movie_title = body["title"]
    expect(movie_title).to eq("test")
  end
end

RSpec.describe 'DELETE /movies', type: :request do
  it 'deletes a movies' do
    movie_1 = Movie.create(title: 'test')
    movie_2 = Movie.create(title: 'taken')
    expect(Movie.count).to eq(2)
    delete "/api/movies/#{movie_1.id}", {}, { "Accept" => "application/json" }
    expect(response.status).to eq 204
    expect(Movie.count).to eq(1)
  end
end
