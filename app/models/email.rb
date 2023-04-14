class Email < ApplicationRecord
  validates :received, presence: true, unless: ->(email) { email.description.present? }
  validates :description, presence: true, unless: ->(email) { email.received.present? }
  validates :tonality, presence: true

  before_validation do
    self.tonality = "casual" if tonality.blank?
  end

  def response
    EmailGenerator.new(self).email_message
  end
end
