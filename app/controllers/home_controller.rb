class HomeController < ApplicationController
  
  def index
  	# TODO: figure out a better way to order. This is really slow
  	@projects = Project.has_image.all.sort_by(&:shuffled_order)[0...4]
  	authorize! :index, Project
  end
  
end
