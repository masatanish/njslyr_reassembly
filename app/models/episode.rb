class Episode
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Tree
  include Mongoid::Tree::Ordering

  field :name, type: String
  field :description, type: String

  has_many :tweets
end
