require "rails_helper"

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(first_name: "Jane", last_name: "Doe", email: "jane@example.com", password: "password123")
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user = User.new(email: nil)
    expect(user).not_to be_valid
  end
end
