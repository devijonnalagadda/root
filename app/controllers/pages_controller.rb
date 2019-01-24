class PagesController < ApplicationController
  def home
  	@organizations = Organization.all
  	@users = User.all
  end
end
