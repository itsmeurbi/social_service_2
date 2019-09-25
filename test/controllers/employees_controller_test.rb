require "test_helper"

describe EmployeesController do
  it "should get index" do
    get employees_index_url
    value(response).must_be :success?
  end

  it "should get new" do
    get employees_new_url
    value(response).must_be :success?
  end

  it "should get edit" do
    get employees_edit_url
    value(response).must_be :success?
  end

end
