class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save 
      redirect_to @group, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  def group_params
    params.require(:group).permit(:name)
  end

   def show
    @group = Group.find(params[:id])
   end
   
   def index
    @groups = Group.all
  end
end
