on_fire = Status.create(description: 'on_fire')
rusty = Status.create(description: 'rusty')
screws_loose = Status.create(description: 'screws_loose')
scratched_paint = Status.create(description: 'scratched_paint')
statuses = [on_fire, rusty, screws_loose, scratched_paint]


def get_config
  Configuration.create(
      sentience: [true, false].sample,
      wheels: [true, false].sample,
      tracks: [true, false].sample,
      number_of_rotors: (0..16).to_a.sample,
      colour: %w[red green blue].sample
  )
end

200.times do |i|
  configuration = get_config

  Robot.create(name: "Robot QA #{i}", configuration: configuration, stage: :qa, statuses: [statuses.sample])
end

configuration = Configuration.create(sentience: true, wheels: true, tracks: true,
    number_of_rotors: 5,
    colour: 'red'
)
Robot.create(name: "Robot On Fire", configuration: configuration, stage: :qa, statuses: [on_fire])
Robot.create(name: "Robot Recycled", configuration: get_config, stage: :recycled)
Robot.create(name: "Robot Factory Seconds", configuration: get_config, stage: :factory_seconds)