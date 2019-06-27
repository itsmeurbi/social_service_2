# frozen_string_literal: true

require "test_helper"

describe StudentController do
  it "should get index" do
    get student_index_url
    value(response).must_be :success?
  end

  it "should get new" do
    get student_new_url
    value(response).must_be :success?
  end
end
