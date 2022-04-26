class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title
      t.datetime :deadline
      t.string :type
      t.string :status
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
