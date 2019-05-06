require "rails_helper"

RSpec.describe Task, type: :model do
  context "validations test" do
    it "ensures description presence" do
      task = Task.new(task_list_id: "2").save
      expect(task).to eq(false)
    end

    it "ensures task_list_id presence" do
      task = Task.new(description: "Una nueva tarea").save
      expect(task).to eq(false)
    end
  end
end
