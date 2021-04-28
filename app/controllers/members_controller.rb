class MembersController < ApplicationController
  def show
    @member = current_member
  end

  def following
        #@memberがフォローしているユーザー
        @member  = Member.find(params[:id])
        @members = @member.following
        render 'show_follow'
  end

  def followers
      #@memberをフォローしているユーザー
      @member  = Member.find(params[:id])
      @members = @member.followers
      render 'show_follower'
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if @member.update(member_params)
       redirect_to member_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def member_params
   	params.require(:member).permit(:name, :username, :introduction, :birthday, :email)
  end

end
