class DestinationsController < ApplicationController

  def show
    @destination = Destination.find(params[:id])
    max = 5
    if max > @destination.posts.length
      max = @destination.posts.length
    end
    @five_posts = @destination.posts.last(max)
  end

end
