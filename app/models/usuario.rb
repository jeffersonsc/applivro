class Usuario < ActiveRecord::Base 
 
  attr_accessible :nome, :sobrenome ,:sexo, :avatar, :aniversario, :aceito, :email, :senha, :senha_confirmation

has_many :livro

 has_attached_file :avatar, :styles => {
  :medium => "200x200>",
  :thumb => "150x150#",
  :ico => "60x60#"
 }

 

  attr_accessor :senha  
  before_save :encrypt_senha

  validates_confirmation_of :senha
  validates_presence_of :senha , :on => :create
  validates :email ,
            presence: true, 
            uniqueness: true, 
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }, 
            :on => :create
  validates :email,
            presence: true,
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i },
            :on => :edit

  validates_presence_of :nome, :sobrenome, :aceito


  def self.authenticate(email, senha)
  	@usuario = find_by_email(email)

  	if @usuario && @usuario.senha_hash == BCrypt::Engine.hash_secret(senha, @usuario.senha_salt)
  	  @usuario
  	else
  		nil
  	end
  end

def encrypt_senha
	if @senha.present?
		self.senha_salt = BCrypt::Engine.generate_salt
    self.senha_hash = BCrypt::Engine.hash_secret(senha, senha_salt)
	end
end



end
