# encoding: utf-8

Refinery::I18n.configure do |config|
  # config.enabled = true
  config.enabled = true
  # config.default_locale = :en
  config.default_locale = :"zh-CN"

  # config.current_locale = :en
  config.current_locale = :"zh-CN"

  # config.default_frontend_locale = :en

  # config.frontend_locales = [:en]
  config.default_frontend_locale = :"zh-CN"
  config.frontend_locales = [:"zh-CN"]

  # config.locales = {:en=>"English", :fr=>"Français", :nl=>"Nederlands", :"pt-BR"=>"Português", :da=>"Dansk", :nb=>"Norsk Bokmål", :sl=>"Slovenian", :es=>"Español", :it=>"Italiano", :de=>"Deutsch", :lv=>"Latviski", :ru=>"Русский", :sv=>"Svenska", :pl=>"Polski", :"zh-CN"=>"Simplified Chinese", :"zh-TW"=>"Traditional Chinese", :el=>"Ελληνικά", :rs=>"Srpski", :cs=>"Česky", :sk=>"Slovenský", :ja=>"日本語", :bg=>"Български"}
  config.locales = {:en=>"English", :"zh-CN"=>"Simplified Chinese", :ja=>"日本語"}
end
