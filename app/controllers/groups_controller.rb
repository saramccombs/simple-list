class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @names = get_group_names
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def get_group_names
    all_names =[]
    Group.all.map { |g| @all_names << g.groupname }
    all_names.uniq
  end
end
