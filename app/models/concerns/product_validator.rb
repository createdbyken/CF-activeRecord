class ProductValidator < ActiveModel::Validator
  def validate(record)
    #it calls the method validate_stock 
    self.validate_stock(record)
  end

  def validate_stock(record)
    record.errors.add(:stock, 'The stock must be greater than 0') if record.stock.negative?
  end
end
