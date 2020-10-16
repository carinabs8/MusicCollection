#encoding: utf-8
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){ create(:user) }
  context :validations do
    [:role, :fullname, :username].each do |attr|
      it "Cannot be blank" do
        user.send("#{attr}=", "")
        expect(user.valid?).to eq(false)
      end
    end

    it "Role have to be included in [admin, user]" do
      user.role = "messager"
      expect(user.valid?).to eq(false)
      expect(user.errors.messages).to eq({:role=>["is not included in the list"]})
    end
  end

  it "Should create a valid user" do
    user.attributes = {role: ProfileEnum::USER, fullname: "Roger", username: "roger", password: "123456", password_confirmation: "123456"}
    expect(user.save).to eq(true)
  end
end
