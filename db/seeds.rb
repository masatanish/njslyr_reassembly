# encoding:utf-8
require 'date'
require 'yaml'
require 'csv'

# import tweets
Dir.glob(File.join(Rails.root, 'db/seeds/tweets/*.csv')).each do |path|
  puts path
  CSV.open(path).each do |row|
    id = row[1].gsub(/.*\//, '')
    text = row[0].gsub(/"/,"\\\"")
    date = DateTime.parse(row[2])
 
    tw = Tweet.find_or_create_by(tweet_id:id)
    tw.update_attributes(text:text, posted_at: date)
  end
end

# import episodes
episodes = YAML.load(File.read(File.join(Rails.root, 'db/seeds/episodes_and_tweets_id.yaml')))

def traverse(obj, parent=nil)
  if obj.kind_of? Hash
    ret = {}
    obj.each do |k, v|
      puts k
      epi = Episode.create(name: k)
      parent.children << epi unless parent.nil?
      traverse(v, epi)
    end
  else
    if obj.kind_of? Array
      puts "added tweet"
      begin
      tweets = Tweet.find(obj).to_a.reverse
      parent.tweets = tweets
      rescue => e
        puts e
      end
    end
  end
end
traverse(episodes)
