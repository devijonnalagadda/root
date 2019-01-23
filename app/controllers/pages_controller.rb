class PagesController < ApplicationController
  def home
  	@organizations = Organization.all
  	@users = User.all
  	@projects = Project.all
  end
end
