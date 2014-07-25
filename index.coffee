irc = require 'irc'

client_irc = new irc.Client process.env.IRC_HOST, process.env.USERNAME,
  channels: [ process.env.IRC_CHANNEL ]
  username: process.env.USERNAME

client_slack = new irc.Client process.env.SLACK_HOST, process.env.USERNAME,
  channels: [ process.env.SLACK_CHANNEL ]
  username: process.env.USERNAME
  password: process.env.SLACK_PASS
  secure: true


client_irc.addListener 'message', (from, to, message)->
  client_slack.say '#general', "(#{from}): #{message}"
  console.log "#{from} => #{to}: #{message}"


client_slack.addListener 'message', (from, to, message)->
  client_irc.say '#邪気眼Ⅱ', "(#{from}): #{message}"
  console.log "#{from} => #{to}: #{message}"
