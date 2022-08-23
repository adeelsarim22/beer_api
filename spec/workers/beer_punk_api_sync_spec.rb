require 'rails_helper'

require 'sidekiq/testing'
Sidekiq::Testing.inline!

RSpec.describe 'BeerPunkApiSync', type: :workers do
  describe '#sync_punk_api' do
    it 'syn beers with punk api' do
      stub_punk_beers_get
      BeerPunkApiSync.new.perform
      expect(Beer.count).to eq(1)
    end
  end
end
