class FeedbacksController < ApplicationController
    # before_action :logged_in_user, only:[:edit, :update, :destroy] 別の仕組みで解決している
    before_action :authenticate_user!
    def index
        #トップ画面が表示された時に動作するアクション
        @feedbacks = Feedback.all
        favorites = Favorite.where(user_id: current_user.id).pluck(:feedback_id)
        @favorites = Feedback.find(favorites)
    end
    
    def new
        #新しいフィードバックを送るときに動作するアクション
    end
    
    def create
        #新しいフィードバックがフォームからPostされた時に動作するアクション
        feedback = Feedback.create(title:params["feedbacks"]["title"],assist:params["feedbacks"]["assist"],action:params["feedbacks"]["action"],user_id:params["feedbacks"]["user"])
        Author.create(feedback_id:feedback.id,user_id:current_user.id)
        feedback.save
        redirect_to "/"
    end
     
    def destroy
        feedback = Feedback.find(params["id"])
        feedback.destroy
        redirect_to "/"
    end
    
    def edit
        @feedback = Feedback.find(params["id"])
    end
    
    def update
        feedback = Feedback.find(params["id"])
        feedback.title = params["feedbacks"]["title"]
        feedback.assist = params["feedbacks"]["assist"]
        feedback.action = params["feedbacks"]["action"]
        feedback.user_id = params["feedbacks"]["user"]
        feedback.save
        redirect_to "/"
    end
    
    def show
        @user = User.find(params[:id])
        @feedbacks = Feedback.where(user_id:params[:id])
    end
    
    def favorite
        @user = User.find(params[:id])
        favorites = Favorite.where(user_id:current_user.id).order(created_at: :desc).pluck(:feedback_id)
        @feedbacks = Feedback.find(favorites)
    end
    
    def product_params
        params.require(:product).permit(:name, :price, :image, :image_cache, :remove_image)
    end
end
