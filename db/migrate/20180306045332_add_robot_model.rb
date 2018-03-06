class AddRobotModel < ActiveRecord::Migration[5.1]
  def change
    create_table :robots do |t|
      t.string :name, null: false
      t.string :shipment_number
      t.integer :stage, null: false, default: :qa
      t.timestamps
    end

    create_table :configurations do |t|
      t.belongs_to :robot, index: true
      t.boolean :sentience
      t.boolean :wheels
      t.boolean :tracks
      t.integer :number_of_rotors
      t.string :colour
      t.timestamps
    end

    create_table :statuses do |t|
      t.string :description, null: false
      t.timestamps
    end

    create_table :robots_statuses do |t|
      t.belongs_to :robot, index: true
      t.belongs_to :status, index: true
    end
  end
end
