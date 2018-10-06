require "application_system_test_case"

class EnvironmentsTest < ApplicationSystemTestCase
  setup do
    @environment = environments(:one)
  end

  test "visiting the index" do
    visit environments_url
    assert_selector "h1", text: "Environments"
  end

  test "creating a Environment" do
    visit environments_url
    click_on "New Environment"

    fill_in "Is Advisors Register Active", with: @environment.is_advisors_register_active
    fill_in "Is Schedules Register Active", with: @environment.is_schedules_register_active
    fill_in "Is Students Register Active", with: @environment.is_students_register_active
    fill_in "Month", with: @environment.month_id
    fill_in "Semester", with: @environment.semester_id
    click_on "Create Environment"

    assert_text "Environment was successfully created"
    click_on "Back"
  end

  test "updating a Environment" do
    visit environments_url
    click_on "Edit", match: :first

    fill_in "Is Advisors Register Active", with: @environment.is_advisors_register_active
    fill_in "Is Schedules Register Active", with: @environment.is_schedules_register_active
    fill_in "Is Students Register Active", with: @environment.is_students_register_active
    fill_in "Month", with: @environment.month_id
    fill_in "Semester", with: @environment.semester_id
    click_on "Update Environment"

    assert_text "Environment was successfully updated"
    click_on "Back"
  end

  test "destroying a Environment" do
    visit environments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Environment was successfully destroyed"
  end
end
