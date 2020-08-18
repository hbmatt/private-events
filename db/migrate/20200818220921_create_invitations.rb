class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :invitee, references: :users, index: true
      t.references :recipient, references: :users, index: true
      t.references :event, index: true

      t.timestamps
    end

    add_foreign_key :invitations, :users, column: :invitee_id
    add_foreign_key :invitations, :users, column: :recipient_id
  end
end
