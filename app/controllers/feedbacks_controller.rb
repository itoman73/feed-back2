class FeedbacksController < ApplicationController
    # before_action :logged_in_user, only:[:edit, :update, :destroy] 別の仕組みで解決している
    def index
        #トップ画面が表示された時に動作するアクション
        @feedbacks = Feedback.all    
    end
    
    def new
        #新しいフィードバックを送るときに動作するアクション
    end
    
    def create
        #新しいフィードバックがフォームからPostされた時に動作するアクション
        Feedback.create(title:params["feedbacks"]["title"],assist:params["feedbacks"]["assist"],action:params["feedbacks"]["action"],user_id:params["feedbacks"]["user"])
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
end
