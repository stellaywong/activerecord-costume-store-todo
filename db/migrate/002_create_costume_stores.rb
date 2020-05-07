# Create your costume_stores migration here
class CreateCostumeStores < ActiveRecord::Migration[4.2]
    def change
        create_table :costume_stores do |t|
            t.string :name
            t.string :location
            t.integer :costume_inventory
            t.integer :num_of_employees
            t.boolean :still_in_business    # boolean makes it true/false
            t.datetime :opening_time        # rake db:migrate migrates all migrations at once
            t.datetime :closing_time        # rake db:rollback rolls back 1 migration at a time, from most recent
        end
    end
end