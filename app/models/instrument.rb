class Instrument < ActiveRecord::Base
  validates :name, :price, :group,  presence: true
end
