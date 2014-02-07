require 'spec_helper'

describe 'Routing:' do
  describe 'Home:' do
    it 'routes to HomeController < ApplicationController #index' do
      expect(get: root_path).to route_to(controller: "home", action: "index")
    end
  end
end