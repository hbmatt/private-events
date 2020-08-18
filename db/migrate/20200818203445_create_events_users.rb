class CreateEventsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :events_users, id: false do |t|
      t.references :attendee, references: :users, index: true
      t.references :attended_event, references: :events, index: true
    end

    add_foreign_key :events_users, :users, column: :attendee_id
    add_foreign_key :events_users, :events, column: :attended_event_id
  end
end