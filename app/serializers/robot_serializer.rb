class RobotSerializer < ActiveModel::Serializer
  attributes :id, :name, :stage
  has_one :configuration, serializer: ConfigurationSerializer
  has_many :statuses, serializer: StatusSerializer
end
