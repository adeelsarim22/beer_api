class PunkApi::Beers < ClientBase
  base_uri 'https://api.punkapi.com/v2/'

  def get(options = {})
    url = '/beers'
    options = { query: options } if options.any?
    make_request('get', url, options)
  end

  def get_by_id(id)
    url = "/beers/#{id}"
    make_request('get', url)
  end

  def get_random
    url = '/beers/random'
    make_request('get', url)
  end
end
