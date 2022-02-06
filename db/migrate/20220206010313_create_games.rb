class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :rank
      t.string :name
      t.integer :year
      t.references :platform, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true
      t.decimal :NA_sales
      t.decimal :EU_sales
      t.decimal :JP_sales
      t.decimal :other_sales
      t.decimal :Global_sales

      t.timestamps
    end
  end
end
