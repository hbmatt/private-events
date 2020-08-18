class User < ApplicationRecord
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
  has_and_belongs_to_many :attended_events, foreign_key: 'attendee_id', association_foreign_key: 'attended_event_id', class_name: 'Event'
  has_many :created_invitations, foreign_key: 'invitee_id', class_name: 'Invitation'
  has_many :received_invitations, foreign_key: 'recipient_id', class_name: 'Invitation'
end
