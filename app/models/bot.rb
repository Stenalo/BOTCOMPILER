class Bot < ApplicationRecord
  def self.search_words(words)
    CLIENT.search(words, lang: "en").first.text
  end
  def self.follow_user name
    CLIENT.follow(name)
  end
  def self.respond name
    "@" + name + " " + Response.first.message
  end
  def self.find_user number, words
    CLIENT.search(words, lang: "en").take(number).each { |t|
      User.create(name: t.user.screen_name, tweet_id: t.id.to_s)
      CLIENT.update(Bot.respond(t.user.screen_name), in_reply_to_status_id: t.id)
    }
  end
  def self.japa_search
    CLIENT.search("#ruby -rt", lang: "ja").first.text
  end
  def self.new
    now = Time.find_zone('Paris').now
    if (now.hour <= 0)
      #status = "wesh alors"
      CLIENT.update("wesh alors")
    end
  end
  #CLIENT.sample do |object|
   # puts object.text if object.is_a?(Twitter::Tweet)
  #end
end
