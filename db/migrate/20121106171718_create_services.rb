class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name, :required => true
      t.string :status, :required => true, :default => 'up'
      t.string :url

      t.timestamps
    end
  end
end
