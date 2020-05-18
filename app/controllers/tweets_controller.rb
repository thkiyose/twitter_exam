class TweetsController < ApplicationController
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
    @tweet = Tweet.find_by_id(params[:id])
  end

  def update
    @tweet = Tweet.find_by_id(params[:id])
    if @tweet.update(content_params)
      redirect_to tweets_path, notice:"投稿を編集しました。"
    else
      render :edit
    end
  end

  def destroy
    @tweet = Tweet.find_by_id(params[:id])
    @tweet.destroy
    redirect_to tweets_path, notice: "投稿を削除しました。"
  end

  def confirm
    @tweet = Tweet.new(content_params)
  end

  private
  def content_params
    params.require(:tweet).permit(:content)
  end
end
