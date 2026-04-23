class Pet < ApplicationRecord
  belongs_to :owner
  has_many :appointments, dependent: :destroy

  before_save :capitalize_name


  validates :name, :date_of_birth, :weight, presence: true
  validates :species, presence: true, inclusion: { in: %w[dog cat rabbit bird reptile other] }
  validates :weight, numericality: { greater_than: 0 }
  validate :date_of_birth_cannot_be_in_the_future

  scope :by_species, ->(species) { where(species: species) }

  private

  def capitalize_name
    self.name = name.capitalize if name.present?
  end

  def date_of_birth_cannot_be_in_the_future
    if date_of_birth.present? && date_of_birth > Date.current
      errors.add(:date_of_birth, "cannot be in the future")
    end
  end
end
