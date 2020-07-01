require 'rails_helper'
describe SafeDeleted::ActsAsSafeDeleted do
  before {
    create(:user, :active)
    create(:user, :inactive)
  }
  it "returns data is_active is true" do
    expect(User.active.present?).to eql(true)
  end

  it "returns data is_active is false" do
    expect(User.inactive.present?).to eql(true)
  end

  it "updates data become false" do
    user = User.last
    user.soft_delete
    expect(user.is_active).to eql(false)
  end

  it "updates all data" do
    User.soft_delete_all
    expect(User.all.pluck(:is_active).include?(true)).to eql(false)
  end

end
