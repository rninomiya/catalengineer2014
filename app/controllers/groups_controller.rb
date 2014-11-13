class GroupsController < ApplicationController
  def newaction
  end
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
 
   def edit
    @group = Group.find(params[:id])
   end
  
   def update
    @group = Group.find(params[:id])
  if @group.update(group_params)
    redirect_to @group
  else
    render :edit
  end
end

def destroy
  @group = Group.find(params[:id])
  @group.destroy
  redirect_to groups_path
end
end

