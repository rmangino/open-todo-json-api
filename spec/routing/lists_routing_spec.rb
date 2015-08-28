require 'rails_helper'

RSpec.describe ListsController, type: :routing do
  it { expect(get:    "/lists").to   route_to("lists#index") }
  it { expect(get:    "/lists/1").to route_to("lists#show", id: "1") }
  it { expect(post:   "/lists").to   route_to("lists#create") }
  it { expect(put:    "/lists/1").to route_to("lists#update", id: "1") }
  it { expect(delete: "/lists/1").to route_to("lists#destroy", id: "1") }
end