class SessionsController < ApplicationController
  def new  
  end

  def create
  	@usuario = Usuario.authenticate(params[:email], params[:senha])
  		if @usuario
  			session[:usuario_id] = @usuario.id
  			redirect_to index_usuario_path
  			flash[:notice] = "Logado com sucesso!"
  		else
  			flash[:alert] = "Usuario ou senha invalidos"
  			render "new"
  		end
  	end

  	def destroy
  		session[:usuario_id] = nil
  		redirect_to entrar_path
  		flash[:notice] = "Voce deslogou com sucesso!"
  end

end
