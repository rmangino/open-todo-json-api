class AddCompleteToItem < ActiveRecord::Migration
  def change
    add_column :items, :complete, :boolean, null: false, default: false
  end
end
