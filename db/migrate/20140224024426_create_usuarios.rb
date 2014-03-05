class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :email
      t.string :senha_hash
      t.string :senha_salt

      t.timestamps
    end
  end
end
