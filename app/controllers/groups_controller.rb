class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
    @group = Group.new
    @groups = Group.all.order(updated_at: :desc)
    #@groups = Group.all.search(params[:search])
    @nongroups = Group.where(id: GroupUser.where.not(member_id: current_member.id).pluck(:id))
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      @group.members << current_member
      redirect_to groups_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def show
    #@group = Group.find_by(id: params[:id])

    #if !@group.members.include?(current_member)
      #@group.members << current_member
    #end

    #@groupposts = Grouppost.where(group_id: @group.id).all

    @group = Group.find_by(id: params[:id])
    @groupposts = @group.groupposts
  end

  def update
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def grouppost_params
    params.require(:grouppost).permit(:content)
  end


end
