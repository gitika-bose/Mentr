require 'rails_helper'

RSpec.describe "routes", :type => :routing do
  describe 'root path' do
    it 'direct to homepage' do
      expect(:get => "/").to route_to(
          :controller => "homepage",
          :action=>"index",
        )
    end
  end
end
