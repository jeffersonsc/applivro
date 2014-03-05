class HomeController < ApplicationController
  def index
  	if current_user
  		redirect_to index_usuario_path
    	end
  end
  	
  
end
