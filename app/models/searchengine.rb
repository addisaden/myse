class Searchengine < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, format: { with:  /\Ahttps?:\/\/\S+\z/i, message: "Only valid urls allowed." }

  before_save :count_arguments

  def search(argument_string)
    if arg_count == 0 then
      return self.url
    elsif arg_count == 1 then
      return (self.url % [URI.encode(argument_string)])
    else
      return (self.url % argument_string.split(',').collect { |arg_part| URI.encode(arg_part) })
    end
  end

  private

  def count_arguments
    self.arg_count = self.url.count('%s')/2
  end
end
