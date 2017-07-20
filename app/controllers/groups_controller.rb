class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update, :destroy]
  before_action :set_users, only: [:new, :create, :edit, :update]

  def index
    @groups = Group.order(name: :asc).includes(:users).load
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to root_url, notice: 'Group created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to root_url, notice: 'Group updated.'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to root_url, notice: 'Group deleted.'
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def set_users
    @users = User.order(name: :asc)
  end

  def group_params
    params.require(:group).permit(:name, memberships_attributes: [:user_id, :id, :_destroy])
  end
end
