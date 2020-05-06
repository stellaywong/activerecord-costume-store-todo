# Create your costume_stores migration here
class CostumeStores < ActiveRecord::Migration
    def change
        create_table :costume_stores do |t|
            t.string :name
            t.string :location
            t.integer :costume_inventory
            t.integer :num_of_employees
            # t.binary :still_in_business

        end
    end
end