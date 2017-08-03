require 'slack-notifier'
require 'settingslogic'
require 'logger'
require 'business_time'

require 'pry'

ROOT = File.expand_path(File.dirname(__FILE__))

class Settings < Settingslogic
  source "#{ROOT}/config/settings.yml"
end

logger = Logger.new("#{ROOT}/logs/notifer.log")
logger.debug("Start")

today = Date.today
Settings.slack.messages.each do |message|
  begin
    submit_date = Date.new(today.year, today.month, message.when.day == "*" ? today.day : message.when.day)
    submit_date = submit_date.since(submit_date.workday? ? 0.day : -1.day).to_date while !submit_date.workday?
    if submit_date >= today && today.business_days_until(submit_date) == 0
      notifier = Slack::Notifier.new(message.webhook_uri, message.option)
      notifier.ping(message.message)
    end
  rescue => e
    logger.fatal(e)
  end
end

logger.debug("Finish")

#binding.pry
