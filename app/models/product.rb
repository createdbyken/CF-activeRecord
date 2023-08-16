# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  title      :string
#  code       :string
#  price      :integer          default(0)
#  stock      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Product < ApplicationRecord
  # save
  before_save :validate_product
  after_save :send_notification
  after_save :push_notification, if: :discount?

  # Makes a validation with a personalized message
  validates :title, presence: { message: 'Needs to define a value for the title' }
  validates :code, presence: { message: 'Needs to define a value for the code ' }

  validates :code, uniqueness: { message: 'The code: %{value} has already been taken. Use another code' }
  # validates :price, length: { minimum: 3, maximum: 10, message: 'The price must be at least 3 digits' }
  validates :price, length: { in: 3..10, message: 'The price must seems to be out of range. Min 3 max 10' }, if: :has_price?

  # Own personalized validation (Executes ActiveRecord validations first)
  validate :code_validate
  validates_with ProductValidator

  def total
    self.price / 100
  end

  def discount?
    self.total < 5
  end

  def has_price?
    !self.price.nil? && self.price.positive?
  end

  private

  def code_validate
    if self.code.nil? || self.code.length < 3
      self.errors.add(:code, 'The code is not valid.')
    end
  end

  def validate_product
    puts "\n\n\n>>> A new product will be added to stored!"
  end

  def send_notification
    puts "\n\n\n>>> A new product has been stored: #{title}, $#{self.total} USD"
  end

  # if precio < 5, push notification is called
  def push_notification
    puts "\n\n\n>>> A new product with a discount is available: #{title}"
  end
end
