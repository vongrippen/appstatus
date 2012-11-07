class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :service, :required => true
      t.references :admin_user, :required => true
      t.string :short_message, :required => true
      t.text :full_message

      t.timestamps
    end
  end
end
