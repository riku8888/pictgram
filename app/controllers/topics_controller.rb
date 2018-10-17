class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end


#追加部分
=begin
  def user_logged_in?
    if session[:user_id]
      begin
        @current_user = User.find_by(user_id: session[:user_id])
      rescue ActiveRecord::RecordNotFound
        reset_user_session
      end
    end
    return if @current_user
    # @current_userが取得できなかった場合はログイン画面にリダイレクト
    redirect_to login_path
  end

  def reset_user_session
    session[:user_id] = nil
    @current_user = nil
  end
=end




    private
    def topic_params
      params.require(:topic).permit(:image, :description)
    end

    before_action :user_logged_in?



end
