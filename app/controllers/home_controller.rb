class HomeController < ApplicationController
  def index
    if current_user
      @questions = Question.all
      render 'questions/index'
    end
  end

  def follow_user
    follower = current_user.follow_users.find_or_initialize_by(follower_id: params[:user_id])
    if follower.new_record?
      follower.save
      flash[:notice] = "You are now follows - #{follower.user.email} (User:#{follower.user_id})"
    else
      flash[:alert] = 'Already following'
    end
    redirect_to question_path(params[:question_id])
  end

  def follow_topic
    follower = current_user.follow_topics.find_or_initialize_by(topic_id: params[:topic_id])
    if follower.new_record?
      follower.save
      flash[:notice] = "You are now follows - #{follower.topic.desc} (Topic:#{follower.topic_id})"
    else
      flash[:alert] = 'Already following'
    end
    redirect_to question_path(params[:question_id])
  end

end
