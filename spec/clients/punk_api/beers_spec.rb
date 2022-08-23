require 'rails_helper'

describe PunkApi::Beers do
  before do
    @client = PunkApi::Beers.new
  end

  context '#beers' do
    it 'get all beers' do
      stub_punk_beers_get
      response = @client.get
      expect(response.count).to eq(1)
    end

    it 'get all beers with pagination' do
      stub_punk_beers_get
      response = @client.get({ page: 1, per: 2 })
      expect(response.count).to eq(1)
    end

    it 'get all beers with beer_name' do
      stub_punk_beers_get
      response = @client.get({ beer_name: 'test' })
      expect(response.count).to eq(1)
    end
  end

  context '#beers/{id}' do
    it 'get beer by id' do
      stub_punk_beers_get_by_id(1)
      response = @client.get_by_id(1)
      expect(response.count).to eq(1)
    end
  end

  context '#beers/random' do
    it 'get random beer' do
      stub_punk_beers_get_random
      response = @client.get_random
      expect(response.count).to eq(1)
    end
  end
end
