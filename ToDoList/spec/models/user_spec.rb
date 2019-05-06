require "rails_helper"

RSpec.describe User, type: :model do
  context "validations test" do
    it "ensures username presence" do
      user = User.new(email: "example@example.com", description: "No one").save
      expect(user).to eq(false)
    end

    it "ensures email presence" do
      user = User.new(username: "Noob", description: "No one").save
      expect(user).to eq(false)
    end

    it "should save successfully" do
      user = User.new(username: "Noob",email: "example@example.com", description: "No one").save
      expect(user).to eq(false)
  end
end
