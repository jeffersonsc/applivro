class UsuariosController < ApplicationController
 
def index
  @usuario = Usuario.find(session[:usuario_id])
  @livro = @usuario.livro.limit(5).paginate(page: params[:page], :per_page => 5)

end

  def new
  	@usuario = Usuario.new
  end


  def create
  	@usuario = Usuario.new(params[:usuario])
  		if @usuario.save
  			flash[:notice] = "Criado com sucesso!"
        redirect_to entrar_path
  		
      else
  			render "new"
  		end
  	end
 

  def show
    
    #@usuario = Usuario.find(session[:usuario_id])
    @usuario = Usuario.find(params[:id])
    @livro = @usuario.livro.paginate(page: params[:page], :per_page => 5)

   
   end

   def listar
    @usuario = Usuario.find(session[:usuario_id])
    @usuarios = Usuario.all
   end


   def edit
    @usuario = Usuario.find(session[:usuario_id])
   end

   def update
    @usuario = Usuario.find(session[:usuario_id])
    if @usuario.update_attributes(params[:usuario])
      flash[:notice] = "Perfil com sucesso!"
      redirect_to edit_usuario_path
    else
      render "edit"
   end
 end

 def destroy
  @usuario = Usuario.find(session[:usuario_id])
  @usuario.destroy

  redirect_to sair_path
  flash[:notice] = "Conta excluida com sucesso!"
 end


end