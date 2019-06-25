# frozen_string_literal: true

require "test_helper"

describe CertificatesController do
  it "should get index" do
    get certificates_index_url
    value(response).must_be :success?
  end

  it "should get new" do
    get certificates_new_url
    value(response).must_be :success?
  end

  it "should get edit" do
    get certificates_edit_url
    value(response).must_be :success?
  end
end
