class CreateSubscribes < ActiveRecord::Migration[7.0]
  def change
    create_table :subscribes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subcribable, null: false, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
