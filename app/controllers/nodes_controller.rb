class NodesController < ApplicationController
  def index
    @nodes = Node.all
  end

  def new
    @node = Node.new
  end

  def create
    @node = Node.create! params.require(:node).permit(:base_url)
    redirect_to :nodes, flash: { success: 'A node was created' }
  end

  def show
    @node = Node.find(params[:id])
  end

  def update
  end

  def destroy
    @node = Node.find(params[:id])
    @node.destroy!
    redirect_to :nodes, flash: { success: 'The node was deleted' }
  end
end
