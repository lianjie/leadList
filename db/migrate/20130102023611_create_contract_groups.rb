class CreateContractGroups < ActiveRecord::Migration
  def change
    create_table :contract_groups do |t|
      t.string :group_name
      t.string :file

      t.timestamps
    end
  end
end
