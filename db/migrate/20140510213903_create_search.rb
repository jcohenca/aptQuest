class CreateSearch < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :input
      t.timestamps
      t.references :user
    end
  end
end
