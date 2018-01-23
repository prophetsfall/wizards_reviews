class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :user
      t.belongs_to :wizard
      t.text :body, null: false
      t.integer :rating, null: false

      t.timestamps
    end
  end
end
