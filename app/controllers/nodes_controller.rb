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
    @stats = @node.stats
  end

  def destroy
    @node = Node.find(params[:id])
    @node.destroy!
    redirect_to :nodes, flash: { success: 'The node was deleted' }
  end

  def shutdown
    @node = Node.find(params[:id])
    url = URI.parse(@node.action_url('shutdown'))
    resp, data = Net::HTTP.post_form(url, {auth_token: 'df351d97acbd7d3f7e8cabfa884315ebb5dc336f4062496c40dacba8222907f72d3e199f79c989fef040ff9b18a3b456d2d4237b3f30ddd07404f7a28c8b29a9'})
    if resp['status']=='200 OK'
      return redirect_to :nodes, flash: {success: 'The node was shut down'}
    end
    flash[:alert] = 'An error occurred while shutting down the node'
  end

end
