require 'rails_helper'

RSpec.describe "routes", :type => :routing do
  describe 'root path' do
    it 'for the public' do
      expect(:get => "/").to route_to(
          :controller => "users",
          :action=>"profile",
        )
    end
  end
end
