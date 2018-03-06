require 'rails_helper'

describe 'Robot Routes' do
  it 'routes to the INDEX list robots action' do
    expect(get('/robots.json')).to(
      route_to(controller: 'robots', action: 'index', format: 'json')
    )
  end

  it 'routes to the CREATE extinguish action' do
    expect(post('/robots/1/extinguish.json')).to(
      route_to(controller: 'robots/extinguishes', action: 'create', robot_id: '1', format: 'json')
    )
  end

  it 'routes to the CREATE recycle action' do
    expect(post('/robots/recycle.json')).to(
      route_to(controller: 'robots/recycle', action: 'create', format: 'json')
    )
  end

  it 'routes to the UPDATE shipment action' do
    expect(put('/shipments/create')).to(
      route_to(controller: 'shipments', action: 'update')
    )
  end
end
