# frozen_string_literal: true

# == Schema Information
#
# Table name: editorials
#
#  id           :bigint(8)        not null, primary key
#  id_editorial :string(255)
#  name         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#


require "test_helper"

describe Editorial do
  let(:editorial) { Editorial.new }

  it "must be valid" do
    value(editorial).must_be :valid?
  end
end
