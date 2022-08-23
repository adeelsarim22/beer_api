class ClientBase
  include HTTParty

  base_uri '' # Define Base URI for clients

  def make_request(method, url, options = {})
    error_or_response(self.class.send(method, url, options))
  end

  def error_or_response(response)
    status = response.code
    return respond_with_error(response) if status.between?(400,599)

    response
  end

  def respond_with_error(response)
    code = response.code || 422
    { code: code, errors: response }
  end
end
