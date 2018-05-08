class Addlink < ActiveRecord::Migration
  def change
    add_column :links, :image, :text
  end
end
