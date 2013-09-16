class Searchengine < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, format: { with:  /\Ahttps?:\/\/\S+\z/i, message: "Only valid urls allowed." }

  before_save :count_arguments

  private

  def count_arguments
    self.arg_count = self.url.count('%s')/2
  end
end
