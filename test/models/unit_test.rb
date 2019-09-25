# frozen_string_literal: true

# == Schema Information
#
# Table name: units
#
#  id         :bigint           not null, primary key
#  number     :integer
#  name       :string(255)
#  level_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

describe Unit do
  let(:unit) { Unit.new }

  it "must be valid" do
    value(unit).must_be :valid?
  end
end
