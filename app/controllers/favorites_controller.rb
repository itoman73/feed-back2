class FavoritesController < ApplicationController
  before_action :set_feedback
  before_action :authenticate_user!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）

  # お気に入り登録
  def create
    @favorite = Favorite.create(user_id: current_user.id, feedback_id: @feedback.id)
  end
  # お気に入り削除
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, feedback_id: @feedback.id)
    @favorite.destroy
  end

  private
  
  def set_feedback
    @feedback = Feedback.find(params[:feedback_id])
  end

end
