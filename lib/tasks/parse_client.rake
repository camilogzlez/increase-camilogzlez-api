# frozen_string_literal: true

namespace :parse do
  desc 'drops the db, creates db, migrates db and runs parse service'
  task parse_client: :environment do
    AppServices::ParseClient.new.parse_client
  end
end
