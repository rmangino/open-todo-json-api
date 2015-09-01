require 'rails_helper'

RSpec.describe ItemsController, type: :routing do

  # We don't support #new actions for items
  it { expect(get:    "/lists/42/new").not_to   be_routable }

  it { expect(get:    "/lists/42/items").to     route_to("items#index"           , list_id: "42") }
  it { expect(get:    "/lists/42/items/1").to   route_to("items#show",    id: "1", list_id: "42") }
  it { expect(post:   "/lists/42/items").to     route_to("items#create",           list_id: "42") }
  it { expect(put:    "/lists/42/items/1").to   route_to("items#update",  id: "1", list_id: "42") }
  it { expect(delete: "/lists/42/items/1").to   route_to("items#destroy", id: "1", list_id: "42") }
end