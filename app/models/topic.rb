class Topic < ApplicationRecord
  has_many :follow_topics
  has_many :questions, through: :follow_topics
end
