require "rails_helper"

RSpec.describe TripfamiliesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tripfamilies").to route_to("tripfamilies#index")
    end


    it "routes to #show" do
      expect(:get => "/tripfamilies/1").to route_to("tripfamilies#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/tripfamilies").to route_to("tripfamilies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tripfamilies/1").to route_to("tripfamilies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tripfamilies/1").to route_to("tripfamilies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tripfamilies/1").to route_to("tripfamilies#destroy", :id => "1")
    end

  end
end
