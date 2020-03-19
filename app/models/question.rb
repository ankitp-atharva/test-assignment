class Question < ApplicationRecord
  has_many :answers
  has_many :follow_users
  has_many :follow_topics
end
