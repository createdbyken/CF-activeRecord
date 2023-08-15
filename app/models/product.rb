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

  def total
    self.price / 100
  end

  def discount?
    self.total < 5
  end

  private

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
