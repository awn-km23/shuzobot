require 'slack-ruby-client'

TOKEN = '{YOUR SPACK API TOKEN}'

Slack.configure do |config|
  config.token = TOKEN
end

client = Slack::RealTime::Client.new

client.on :hello do
  puts "connected! welcome '#{client.self.name}' to the '#{client.team.name}' team at https://#{client.team.domain}.slack.com."
end

client.on :message do |data|
    if data['text'].include?('@shuzo')
      words = [
        "<@#{data['user']}> 今日からお前は、富士山だ！",
        "<@#{data['user']}> もっと熱くなれよ！" ,
        "<@#{data['user']}> 君ならできる！",
        ":atsumori:",
        "崖っぷち、だーいすき :heart:",
        "<@#{data['user']}> 大丈夫、君は一人じゃない",
        "<@#{data['user']}> 考えろ！考えるな！"
      ]
      random_word = words.sample
      client.message channel: data['channel'], text: "#{random_word}"
    end
end

client.start!
