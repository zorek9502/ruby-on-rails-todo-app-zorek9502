require "rails_helper"

RSpec.describe User, type: :model do
  context "validations test" do
    it "ensures username presence" do
      user = User.new(email: "example@example.com", description: "No one", password: "Holamundo123").save
      expect(user).to eq(false)
    end

    it "ensures email presence" do
      user = User.new(username: "Noob", description: "No one", password: "Holamundo123").save
      expect(user).to eq(false)
    end

    it "ensures password presence" do
      user = User.new(username: "Noob", description: "No one", email: "example@example.com").save
      expect(user).to eq(false)
    end

    it "should save successfully" do
      user = User.new(username: "Noob", email: Faker::Internet.email, description: "No one", password: "Holamundo123")
      user = user.save
      expect(user).to eq(true)
    end
  end
end
