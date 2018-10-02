require "application_system_test_case"

class SurveysTest < ApplicationSystemTestCase
  setup do
    @survey = surveys(:one)
  end

  test "visiting the index" do
    visit surveys_url
    assert_selector "h1", text: "Surveys"
  end

  test "creating a Survey" do
    visit surveys_url
    click_on "New Survey"

    fill_in "Ability", with: @survey.ability
    fill_in "Clarity", with: @survey.clarity
    fill_in "Comments", with: @survey.comments
    fill_in "Conditions", with: @survey.conditions
    fill_in "Contribution", with: @survey.contribution
    fill_in "Domain", with: @survey.domain
    fill_in "Fears", with: @survey.fears
    fill_in "Impact", with: @survey.impact
    fill_in "Method", with: @survey.method
    fill_in "Satisfaction", with: @survey.satisfaction
    fill_in "Session Has Student", with: @survey.session_has_student_id
    fill_in "Treat", with: @survey.treat
    click_on "Create Survey"

    assert_text "Survey was successfully created"
    click_on "Back"
  end

  test "updating a Survey" do
    visit surveys_url
    click_on "Edit", match: :first

    fill_in "Ability", with: @survey.ability
    fill_in "Clarity", with: @survey.clarity
    fill_in "Comments", with: @survey.comments
    fill_in "Conditions", with: @survey.conditions
    fill_in "Contribution", with: @survey.contribution
    fill_in "Domain", with: @survey.domain
    fill_in "Fears", with: @survey.fears
    fill_in "Impact", with: @survey.impact
    fill_in "Method", with: @survey.method
    fill_in "Satisfaction", with: @survey.satisfaction
    fill_in "Session Has Student", with: @survey.session_has_student_id
    fill_in "Treat", with: @survey.treat
    click_on "Update Survey"

    assert_text "Survey was successfully updated"
    click_on "Back"
  end

  test "destroying a Survey" do
    visit surveys_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Survey was successfully destroyed"
  end
end
