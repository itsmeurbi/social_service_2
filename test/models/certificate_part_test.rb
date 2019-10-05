# frozen_string_literal: true

require "test_helper"

describe CertificatePart do
  let(:certificate_part) { CertificatePart.new }

  it "must be valid" do
    value(certificate_part).must_be :valid?
  end
end
