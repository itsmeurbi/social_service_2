# frozen_string_literal: true
# == Schema Information
#
# Table name: lectures
#
#  id           :bigint(8)        not null, primary key
#  content      :string(255)
#  instructions :string(255)
#  value        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require "test_helper"

describe Lecture do
  let(:lecture) { Lecture.new }

  it "must be valid" do
    value(lecture).must_be :valid?
  end
end
