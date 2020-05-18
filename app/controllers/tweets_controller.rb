class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order(created_at: :desc)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(content_params)
    if @tweet.save
      redirect_to tweets_path, notice: "新規投稿を作成しました。"
    else
      render :new
    end
  end

  def destroy
    @tweet = Tweet.find_by_id(params[:id])
    @tweet.destroy
    redirect_to tweets_path, notice: "投稿を削除しました。"
  end

  private
  def content_params
    params.require(:tweet).permit(:content)
  end
end
