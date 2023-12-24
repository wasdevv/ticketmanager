class Ticket
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, type: String
  field :description, type: String
  field :status, type: String, default: "Open"

  validates :title, :description, :status, presence: true
  validates :status, inclusion: { in: %w{Open Pendent Completed}, message: "%{value} is not a valid status"}
end
