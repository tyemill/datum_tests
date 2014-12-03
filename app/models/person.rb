class Person < ActiveRecord::Base

  validates_presence_of :first_name, :last_name

  # "John Doe" from first_name: "John", last_name: "Doe"
  def name
    "#{self.first_name} #{self.last_name}"
  end

  # "John D." from first_name: "John" last_name: "Doe"
  def short_name
    "#{self.first_name} #{self.last_name.capitalize[0]}."
  end

end
