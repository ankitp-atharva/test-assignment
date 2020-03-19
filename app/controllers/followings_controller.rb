class FollowingsController < ApplicationController
  def index
    @followers = current_user.follow_users.includes(:user)
  end
end
