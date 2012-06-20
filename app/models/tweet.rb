class Tweet
  include Mongoid::Document
  include Mongoid::Timestamps

  field :tweet_id, type: String
  field :text, type: String
  field :posted_at, type: DateTime
end
