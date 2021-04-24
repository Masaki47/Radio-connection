class CreateGroupposts < ActiveRecord::Migration[5.2]
  def change
    create_table :groupposts do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.text :content
      t.timestamps
    end
  end
end
