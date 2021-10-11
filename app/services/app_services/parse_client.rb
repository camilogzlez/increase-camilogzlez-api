# frozen_string_literal: true

module AppServices
  class ParseClient
    require 'faraday'
    def parse_client
      clients = Client.all

      clients.each do |client|
        client_id = client.external_id

        response = Faraday.get("https://increase-transactions.herokuapp.com/clients/#{client_id}") do |req|
          req.headers['Authorization'] = 'Bearer 1234567890qwertyuiopasdfghjklzxcvbnm'
        end
        next unless response.success?

        data = JSON.parse response.body
        client.update(email: data['email'],
                      first_name: data['first_name'],
                      last_name: data['last_name'],
                      job: data['job'],
                      country: data['country'],
                      address: data['address'],
                      zip_code: data['zip_code'],
                      phone: data['phone'])
      end
    end
  end
end
