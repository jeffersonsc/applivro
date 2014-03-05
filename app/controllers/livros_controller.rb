class LivrosController < ApplicationController
 
  def index

    @usuario = Usuario.find(session[:usuario_id])
    @livros = @usuario.livro.limit(5).paginate(page: params[:page], :per_page => 5)
      	
  end

  def show
    @usuario = Usuario.find(session[:usuario_id])
    
    
  end

  def new
  	@livro = Livro.new
  end

  def create
    @usuario = Usuario.find(session[:usuario_id])
    @livro = @usuario.livro.create(params[:livro])
    if @livro.save
      flash[:notice] = "Livro Compatilhado com sucesso!"
      redirect_to index_usuario_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @livro = Livro.find(params[:id])
    @livro.destroy

    flash[:alert]= "Livro excluido com sucesso"
    redirect_to root_url
  end
end
