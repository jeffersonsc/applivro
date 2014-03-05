class CreateLivros < ActiveRecord::Migration
  def change
    create_table :livros do |t|
      t.string :titulo
      t.string :autor
      t.string :comentario
      t.references :usuario

      t.timestamps
    end
  end
end
