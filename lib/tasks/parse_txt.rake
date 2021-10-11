# frozen_string_literal: true

namespace :parse do
  desc 'drops the db, creates db, migrates db and runs txt parse service'
  task parse_txt: [:environment, 'db:drop', 'db:create', 'db:migrate'] do
    AppServices::ParseTransaction.new.parse_txt
  end
end
