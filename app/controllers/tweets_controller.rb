class TweetsController < ApplicationController
  before_action: set_tweet, only [:edit,:update,:destroy]
  def index
    @tweets = Tweet.all.order(created_at: :desc)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(content_params)
    if params[:back]
      render :new
    else
     if @tweet.save
      redirect_to tweets_path, notice: "新規投稿を作成しました。"
     else
      render :new
     end
   end
  end

  def edit
  end

  def update
    if @tweet.update(content_params)
      redirect_to tweets_path, notice:"投稿を編集しました。"
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "投稿を削除しました。"
  end

  def confirm
    @tweet = Tweet.new(content_params)
    render :new if @tweet.invalid?
  end

  private
  def content_params
    params.require(:tweet).permit(:content)
  end

  def set_tweet
    @tweet = Tweet.find_by_id(params[:id])
  end
end
