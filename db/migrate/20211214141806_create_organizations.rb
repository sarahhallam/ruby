class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :company
      t.float :rate

      t.timestamps
    end
  end
end
