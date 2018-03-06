class ConfigurationSerializer < ActiveModel::Serializer
  attributes :sentience, :wheels, :tracks, :number_of_rotors, :colour
  has_one :configuration
  has_many :statuses
end
