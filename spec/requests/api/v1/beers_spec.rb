require 'rails_helper'

RSpec.describe 'Api::V1::Beers', type: :request do
  describe 'GET /index' do
    let!(:beers) { create_list(:beer, 5) }

    it 'returns beers' do
      get '/api/v1/beers'
      response_body = JSON.parse(response.body, { symbolize_names: true })

      expect(response).to have_http_status(:success)
      expect(response_body).to include(:meta)
      expect(response_body[:beers].count).to eq(beers.count)
    end

    it 'returns beers with pagination' do
      get '/api/v1/beers', params: { page: 2, per_page: 1 }
      response_body = JSON.parse(response.body, { symbolize_names: true })

      expect(response).to have_http_status(:success)
      expect(response_body).to include(:meta)
    end

    it 'returns filter beers by name' do
      get '/api/v1/beers', params: { by_name: 'test' }
      response_body = JSON.parse(response.body, { symbolize_names: true })

      expect(response).to have_http_status(:success)
      expect(response_body).to include(:meta)
    end
  end

  describe 'POST /create' do
    it 'returns created beer' do
      post '/api/v1/beers', params: { beer: { name: 'test', description: 'test' } }
      expect(response).to have_http_status(:created)

      response_body = JSON.parse(response.body, { symbolize_names: true })
      expect(response_body[:beer][:name]).to eq('test')
    end
  end

  describe 'GET /show' do
    let!(:beer) { create(:beer) }
    it 'returns beer after find by id' do
      get "/api/v1/beers/#{beer.id}"
      expect(response).to have_http_status(:success)
      response_body = JSON.parse(response.body, { symbolize_names: true })
      expect(response_body[:beer][:name]).to eq(beer.name)
    end
  end

  describe 'GET /random' do
    let!(:beers) { create_list(:beer, 5) }
    it 'returns random beer' do
      get '/api/v1/beers/random'
      expect(response).to have_http_status(:success)
      response_body = JSON.parse(response.body, { symbolize_names: true })

      expect(true).to eq(beers.pluck(:name).include?(response_body[:beer][:name]))
    end
  end
end
