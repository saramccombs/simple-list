class ParentsController < ApplicationController
  def new
    @parent = Parent.new
  end
end
