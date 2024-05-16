require "application_system_test_case"

class SpiesTest < ApplicationSystemTestCase
  setup do
    @spy = spies(:one)
  end

  test "visiting the index" do
    visit spies_url
    assert_selector "h1", text: "Spies"
  end

  test "should create spy" do
    visit spies_url
    click_on "New spy"

    fill_in "Mission", with: @spy.mission
    fill_in "Name", with: @spy.name
    click_on "Create Spy"

    assert_text "Spy was successfully created"
    click_on "Back"
  end

  test "should update Spy" do
    visit spy_url(@spy)
    click_on "Edit this spy", match: :first

    fill_in "Mission", with: @spy.mission
    fill_in "Name", with: @spy.name
    click_on "Update Spy"

    assert_text "Spy was successfully updated"
    click_on "Back"
  end

  test "should destroy Spy" do
    visit spy_url(@spy)
    click_on "Destroy this spy", match: :first

    assert_text "Spy was successfully destroyed"
  end
end
