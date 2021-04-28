class RelationshipsController < ApplicationController
    def create
        @member = Member.find(params[:following_id])
        current_member.follow(@member)
    end

    def destroy
      @member = Member.find(params[:id])
      current_member.unfollow(@member)
    end
end
