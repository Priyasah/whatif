class HomeController < ApplicationController
  def index
  	@question=Question.new

    end


   def users
  	@users = User.all
  end
end
