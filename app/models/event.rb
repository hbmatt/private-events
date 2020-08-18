class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_and_belongs_to_many :attendees, foreign_key: 'attended_event_id', association_foreign_key: 'attendee_id', class_name: 'User'
  has_many :invitations

  scope :upcoming_events, -> { where("date >= ?", Date.today) }
  scope :previous_events, -> { where("date < ?", Date.today) }
end
