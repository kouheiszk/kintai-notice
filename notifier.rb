require 'slack-notifier'
require 'settingslogic'
require 'logger'

require 'pry'

ROOT = File.expand_path(File.dirname(__FILE__))

class Settings < Settingslogic
  source "#{ROOT}/config/settings.yml"
end

notifier = Slack::Notifier.new Settings.slack.webhook_uri do
  defaults channel: Settings.slack.webhook_uri,
           username: Settings.slack.username,
           icon_emoji: Settings.slack.icon_emoji
end

notifier.ping("@channel 先月の勤怠を入力してください\nhttps://p.secure.freee.co.jp/")

# binding.pry
