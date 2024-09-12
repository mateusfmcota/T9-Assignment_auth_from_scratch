class CreatePasswordRecoveries < ActiveRecord::Migration[7.2]
  def change
    create_table :password_recoveries do |t|
      t.string :token
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
