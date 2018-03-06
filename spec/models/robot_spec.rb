require 'rails_helper'

RSpec.describe Robot do
  before do
    @on_fire = Status.create(description: 'on_fire')
    @rusty = Status.create(description: 'rusty')
    @screws_loose = Status.create(description: 'screws_loose')
    Status.create(description: 'recycled')
  end

  describe '#extinguish!' do
    it 'removes the `on fire` status' do
      robot = FactoryBot.create(:robot, statuses: [@on_fire])
      robot.extinguish!
      expect(robot.statuses.length).to eq(0)
    end
  end

  describe '#recycle!' do
    it 'changes the `recycled` stage' do
      robot = FactoryBot.create(:robot)
      robot.recycle!
      expect(robot.stage).to eq('recycled')
    end
  end

  describe '#approve!' do
    it 'changes to the `ready_to_ship` stage' do
      robot = FactoryBot.create(:robot)
      robot.approve!
      expect(robot.stage).to eq('passed_qa')
    end

    it 'changes to the `factory_seconds` stage' do
      robot = FactoryBot.create(:robot, statuses: [@rusty])
      robot.approve!
      expect(robot.stage).to eq('factory_seconds')
    end
  end

  describe '#on_fire' do
    it 'lists records in the scope that are on fire' do
      configuration = FactoryBot.create(:configuration, sentience: true)
      FactoryBot.create(:robot, configuration: configuration, statuses: [@on_fire])
      expect(Robot.sentient_on_fire.size).to eq(1)
    end

    it 'lists records in the scope that are on fire and have multiple statuses' do
      configuration = FactoryBot.create(:configuration, sentience: true)
      FactoryBot.create(:robot, configuration: configuration, statuses: [@on_fire, @rusty])
      expect(Robot.sentient_on_fire.size).to eq(1)
    end

    it 'does not list records in the scope that are not on fire' do
      configuration = FactoryBot.create(:configuration, sentience: true)
      FactoryBot.create(:robot, configuration: configuration, statuses: [@rusty])
      expect(Robot.sentient_on_fire.size).to eq(0)
    end
  end
end
