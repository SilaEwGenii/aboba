class RenameCollumToSubscribe < ActiveRecord::Migration[7.0]
  def change
    rename_column :subscribes, :subcribable_id, :subscribable_id
  end
end
