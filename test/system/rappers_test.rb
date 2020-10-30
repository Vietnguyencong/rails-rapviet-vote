require "application_system_test_case"

class RappersTest < ApplicationSystemTestCase
  setup do
    @rapper = rappers(:one)
  end

  test "visiting the index" do
    visit rappers_url
    assert_selector "h1", text: "Rappers"
  end

  test "creating a Rapper" do
    visit rappers_url
    click_on "New Rapper"

    fill_in "Name", with: @rapper.name
    fill_in "Url", with: @rapper.url
    click_on "Create Rapper"

    assert_text "Rapper was successfully created"
    click_on "Back"
  end

  test "updating a Rapper" do
    visit rappers_url
    click_on "Edit", match: :first

    fill_in "Name", with: @rapper.name
    fill_in "Url", with: @rapper.url
    click_on "Update Rapper"

    assert_text "Rapper was successfully updated"
    click_on "Back"
  end

  test "destroying a Rapper" do
    visit rappers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rapper was successfully destroyed"
  end
end
