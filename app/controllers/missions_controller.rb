class MissionsController < ApplicationController
        before_action :authenticate_user!
        
    def index
        @missions = Mission.all
        @mission = current_user.id
    end

    def update
        mission = Mission.find_by(user_id: params["id"])
        mission.mission = params["body"]["content"]
        mission.user_id = current_user.id
        mission.save
        redirect_to "/missions"
        rescue 
        mission = Mission.create(mission:params["body"]["content"],user_id:current_user.id)
        redirect_to "/missions"
             
    end
end
