# frozen_string_literal: true
# == Schema Information
#
# Table name: levels
#
#  id           :bigint(8)        not null, primary key
#  number       :integer
#  editorial_id :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  name         :string(255)
#

require "test_helper"

describe Level do
  let(:level) { Level.new }

  it "must be valid" do
    value(level).must_be :valid?
  end
end
