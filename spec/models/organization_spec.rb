require "rails_helper"

RSpec.describe Organization, type: :model do
  it "is valid with a name and slug" do
    org = Organization.new(name: "Acme Corp", slug: "acme-corp")
    expect(org).to be_valid
  end

  it "automatically generates a slug from name" do
    org = Organization.create(name: "Acme Global")
    expect(org.slug).to eq("acme-global")
  end
end
