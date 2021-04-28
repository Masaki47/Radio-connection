class CreateGroupposts < ActiveRecord::Migration[5.2]
  def change
    create_table :groupposts do |t|
      t.references :group, foreign_key: true
      t.references :member, foreign_key: true
      t.string :message
      t.timestamps
    end
  end
end
