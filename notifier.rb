require 'slack-notifier'
require 'settingslogic'
require 'logger'

require 'pry'

ROOT = File.expand_path(File.dirname(__FILE__))

class Settings < Settingslogic
  source "#{ROOT}/config/settings.yml"
end

logger = Logger.new("#{ROOT}/logs/notifer.log")
logger.debug("Start")

begin
  notifier = Slack::Notifier.new Settings.slack.webhook_uri, Settings.slack.option
  notifier.ping("@channel 先月の勤怠を入力してください\nhttps://p.secure.freee.co.jp/")
rescue => e
  logger.fatal(e)
end

logger.debug("Finish")

# binding.pry
