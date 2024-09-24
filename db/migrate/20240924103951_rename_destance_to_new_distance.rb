class RenameDestanceToNewDistance < ActiveRecord::Migration[7.1]
  def change
    rename_column :directions, :destance, :distance
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
