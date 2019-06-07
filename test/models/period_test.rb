# frozen_string_literal: true

# == Schema Information
#
# Table name: periods
#
#  id           :bigint(8)        not null, primary key
#  starts_at    :date
#  ends_at      :date
#  editorial_id :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#


require "test_helper"

describe Period do
  let(:period) { Period.new }

  it "must be valid" do
    value(period).must_be :valid?
  end
end
