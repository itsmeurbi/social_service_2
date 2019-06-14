require "test_helper"

describe CertificateTemplatesController do
  it "should get new" do
    get certificate_templates_new_url
    value(response).must_be :success?
  end

  it "should get edit" do
    get certificate_templates_edit_url
    value(response).must_be :success?
  end

end
