class Livro < ActiveRecord::Base
  attr_accessible :autor, :comentario, :titulo, :usuario

  belongs_to :usuario
end
