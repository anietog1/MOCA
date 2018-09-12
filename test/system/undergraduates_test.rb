require "application_system_test_case"

class UndergraduatesTest < ApplicationSystemTestCase
  setup do
    @undergraduate = undergraduates(:one)
  end

  test "visiting the index" do
    visit undergraduates_url
    assert_selector "h1", text: "Undergraduates"
  end

  test "creating a Undergraduate" do
    visit undergraduates_url
    click_on "New Undergraduate"

    fill_in "Name", with: @undergraduate.name
    click_on "Create Undergraduate"

    assert_text "Undergraduate was successfully created"
    click_on "Back"
  end

  test "updating a Undergraduate" do
    visit undergraduates_url
    click_on "Edit", match: :first

    fill_in "Name", with: @undergraduate.name
    click_on "Update Undergraduate"

    assert_text "Undergraduate was successfully updated"
    click_on "Back"
  end

  test "destroying a Undergraduate" do
    visit undergraduates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Undergraduate was successfully destroyed"
  end
end
