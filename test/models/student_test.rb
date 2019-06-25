# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  no_control :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

describe Student do
  let(:student) { Student.new }

  it "must be valid" do
    value(student).must_be :valid?
  end
end
