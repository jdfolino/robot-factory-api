class Robot < ApplicationRecord
  has_one :configuration, dependent: :destroy
  has_and_belongs_to_many :statuses

  scope :sentient_on_fire, lambda {
    joins(:configuration, :statuses)
      .where(configurations: { sentience: true })
      .where(statuses: { description: 'on_fire' })
  }

  enum stage: %i[recycled qa passed_qa factory_seconds ready_to_ship shipped]

  def recycle!
    if stage == :recylced
      false
    else
      update(stage: :recycled)
      true
    end
  end

  def approve!
    if (statuses & Status.factory_seconds_statuses).empty?
      update(stage: :passed_qa)
    else
      update(stage: :factory_seconds)
    end
  end

  def extinguish!
    on_fire = Status.find_by(description: 'on_fire')
    if statuses.include?(on_fire)
      statuses.delete(on_fire)
      true
    else
      false
    end
  end
end
