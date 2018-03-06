class Status < ApplicationRecord
  has_and_belongs_to_many :robots

  def self.factory_seconds_statuses
    [find_by(description: 'rusty'),
     find_by(description: 'screws_loose'),
     find_by(description: 'scratched_paint')]
  end
end
