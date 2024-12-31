release: bundle exec rails db:drop && bundle exec rails db:migrate && bundle exec rails db:seed
web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}