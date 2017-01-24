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

begin
  today = Date.today
  limit_date = Date::new(today.year, today.month, 5) # 毎月5日に通知する

  if limit_date >= today && today.business_days_until(limit_date) <= 1
    notifier = Slack::Notifier.new Settings.slack.webhook_uri, Settings.slack.option
    notifier.ping("@channel 先月の勤怠を入力してください :freee:\nhttps://p.secure.freee.co.jp/")
  end
rescue => e
  logger.fatal(e)
end

logger.debug("Finish")

# binding.pry
