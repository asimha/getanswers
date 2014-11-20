class AddAnswersComments < ActiveRecord::Migration
  def change
    add_column :answers, :answer, :string
    add_column :answers, :comments, :string
  end
end
