class CreatePins < ActiveRecord::Migration[7.1]
  def change
    create_table :pins do |t|
      t.string :title
      t.text :caption
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
