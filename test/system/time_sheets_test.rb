require "application_system_test_case"

class TimeSheetsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @time_sheet = time_sheets(:one)
    sign_in users(:one)
  end

  test "visiting the index" do
    visit time_sheets_url
    assert_selector "h1", text: "Time Sheets"
  end

  test "creating a Time sheet" do
    visit time_sheets_url
    click_on "New Time Sheet"
    click_on "Clock In"

    assert_text "Time sheet was successfully created"
    click_on "Back"
  end

  test "updating a Time sheet" do
    visit time_sheets_url(@time_sheet)
    # save_and_open_screenshot
    # binding.pry
    click_on "Edit", match: :first
    select "2025", from: 'time_sheet[clock_in(1i)]'
    select "May", from: 'time_sheet[clock_in(2i)]'
    select "19", from: 'time_sheet[clock_in(3i)]'
    select "10", from: 'time_sheet[clock_in(4i)]'
    select "20", from: 'time_sheet[clock_in(5i)]'

    select "2025", from: 'time_sheet[clock_out(1i)]'
    select "May", from: 'time_sheet[clock_out(2i)]'
    select "19", from: 'time_sheet[clock_out(3i)]'
    select "11", from: 'time_sheet[clock_out(4i)]'
    select "20", from: 'time_sheet[clock_out(5i)]'

    click_on "Clock In"
    assert_text "Time sheet was successfully updated"
    assert_text(":hours=>1")
    # save_and_open_screenshot
    click_on "Back"
    click_on "Clock out"
    assert_text "Time sheet was clocked out."
  end

  test "destroying a Time sheet" do
    visit time_sheets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Time sheet was successfully destroyed"
  end
end
