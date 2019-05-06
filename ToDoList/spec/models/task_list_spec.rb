require "rails_helper"

RSpec.describe TaskList, type: :model do
  context "validations test" do
    it "ensures title presence" do
      task_list = TaskList.new(user_id: "1").save
      expect(task_list).to eq(false)
    end

    it "ensures user_id presence" do
      task_list = TaskList.new(title: "Una nueva lista").save
      expect(task_list).to eq(false)
    end
  end
end
