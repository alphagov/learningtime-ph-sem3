require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application, :type => :controller do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET to /" do
    it "returns 200 OK with the right content" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get "/"

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello World")
    end
  end

  context "GET to /hello" do
    it "returns 200 OK with the right content and use params" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get "/hello?name=Peter"

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Peter!")
    end
    
    it "returns 200 OK with the right content and use different param" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get "/hello?name=Claude"

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Claude!")
    end
  end

  context "POST to /posts" do
    it "returns 200 OK with the right content" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = post "/posts"

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("post was created")
    end
  end
end