class ShipmentService
  def initialize(ids)
    @ids = ids
  end

  def process
    Robot.transaction do
      @ids.each do |id|
        Robot.find(id).update(stage: :shipped, shipment_number: shipment_number)
      end
    end
  end

  def shipment_number
    (0...8).map { rand(65..90).chr }.join
  end
end
