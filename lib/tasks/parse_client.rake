# frozen_string_literal: true

namespace :parse do
  desc 'runs client parse service'
  task parse_client: :environment do
    AppServices::ParseClient.new.parse_client
  end
end
