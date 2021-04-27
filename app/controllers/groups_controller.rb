class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
    @groups = Group.all.order(updated_at: :desc)
    @groups = Group.all.search(params[:search])
  end

  def new
    @group = Group.new
    @group.members << current_member
  end

  def create
    if Group.create(group_params)
      redirect_to groups_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def show
    @group = Group.find_by(id: params[:id])

    if !@group.members.include?(current_member)
      @group.members << current_member
    end

    @groupposts = Grouppost.where(group_id: @group.id).all
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
    params.require(:group).permit(:name, :member_id [] )
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def grouppost_params
    params.require(:grouppost).permit(:content)
  end


end
