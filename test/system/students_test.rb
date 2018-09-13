require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "creating a Student" do
    visit students_url
    click_on "New Student"

    fill_in "First Name", with: @student.first_name
    fill_in "First Surname", with: @student.first_surname
    fill_in "Is Advisor", with: @student.is_advisor
    fill_in "Is Valid", with: @student.is_valid
    fill_in "Middle Name", with: @student.middle_name
    fill_in "Mobile Phone", with: @student.mobile_phone
    fill_in "Second Surname", with: @student.second_surname
    fill_in "University Code", with: @student.university_code
    fill_in "University Username", with: @student.university_username
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "updating a Student" do
    visit students_url
    click_on "Edit", match: :first

    fill_in "First Name", with: @student.first_name
    fill_in "First Surname", with: @student.first_surname
    fill_in "Is Advisor", with: @student.is_advisor
    fill_in "Is Valid", with: @student.is_valid
    fill_in "Middle Name", with: @student.middle_name
    fill_in "Mobile Phone", with: @student.mobile_phone
    fill_in "Second Surname", with: @student.second_surname
    fill_in "University Code", with: @student.university_code
    fill_in "University Username", with: @student.university_username
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "destroying a Student" do
    visit students_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student was successfully destroyed"
  end
end
