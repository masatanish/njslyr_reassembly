class Tweet
  include Mongoid::Document
  include Mongoid::Timestamps

  field :_id, type: String, default: ->{ tweet_id }
  field :tweet_id, type: String
  field :text, type: String
  field :posted_at, type: DateTime

  default_scope order_by([:posted_at, 'DESC'])
  belongs_to :episode
end
