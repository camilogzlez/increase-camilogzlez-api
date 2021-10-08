

namespace :parse do 
  desc "drops the db, creates db, migrates db and runs parse service"
  task parse_txt: [:environment, 'db:drop', 'db:create', 'db:migrate'] do
    AppServices::ParseTransaction.new.parse_txt
  end
end
