
# whenever
# whenever --update-crontab
# sudo service cron restart
# crontab

# bundle install --path vendor/cache

set :environment, "development"
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}

every 1.minute do
  rake "check_power:check_now"
  puts "okay"
end