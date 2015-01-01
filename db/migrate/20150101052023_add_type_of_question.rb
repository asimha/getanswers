class AddTypeOfQuestion < ActiveRecord::Migration
  def change
  	add_column :questions, :technical, :boolean, :default => false
  	add_column :questions, :non_technical, :boolean, :default => false
  end
end
