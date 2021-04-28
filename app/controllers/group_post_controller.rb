class GroupPostController < ApplicationController
  def new
    @group = Group.find_by(id: params[:group_id])
  end

  def create
    @group = Group.find_by(id: params[:group_id])
    @grouppost = current_member.groupposts.new(grouppost_params)
    @grouppost.group_id = params[:group_id]
    if @grouppost.save
      redirect_to group_path(@group.id)
    end
  end

  private
    def grouppost_params
      params.require(:grouppost).permit(:content)
    end
end
