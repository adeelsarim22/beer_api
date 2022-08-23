module StubberHelper
  def make_beers
    [
      {
        "id": 192,
        "name": 'Punk IPA 2007 - 2010',
        "description": 'Post Modern Classic.'
      }
    ]
  end

  def stub_punk_beers_get(query = {})
    url = 'https://api.punkapi.com/v2/beers'
    stub_request(:get, url).with(
      query: hash_excluding(query)
    ).to_return(status: 200, body: make_beers.to_json, headers: { content_type: 'application/json' })
  end

  def stub_punk_beers_get_by_id(id)
    url = "https://api.punkapi.com/v2/beers/#{id}"
    stub_request(:get, url).to_return(status: 200, body: make_beers.to_json,
                                      headers: { content_type: 'application/json' })
  end

  def stub_punk_beers_get_random
    url = 'https://api.punkapi.com/v2/beers/random'
    stub_request(:get, url).to_return(status: 200, body: make_beers.to_json,
                                      headers: { content_type: 'application/json' })
  end
end

RSpec.configure do |config|
  config.include StubberHelper
end
