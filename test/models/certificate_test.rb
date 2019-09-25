# frozen_string_literal: true
# == Schema Information
#
# Table name: certificates
#
#  id                   :bigint(8)        not null, primary key
#  date                 :date
#  exam_id              :bigint(8)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  certificate_parts_id :bigint(8)
#

require "test_helper"

describe Certificate do
  let(:certificate) { Certificate.new }

  it "must be valid" do
    value(certificate).must_be :valid?
  end
end
