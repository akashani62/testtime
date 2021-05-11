require "application_system_test_case"

class TimeSheetsTest < ApplicationSystemTestCase
  setup do
    @time_sheet = time_sheets(:one)
  end

#   test "visiting the index" do
#     visit time_sheets_url
#     assert_selector "h1", text: "Time Sheets"
#   end
#
#   test "creating a Time sheet" do
#     visit time_sheets_url
#     click_on "New Time Sheet"
#
#     # fill_in "Clock in", with: @time_sheet.clock_in
#     # check "Started" if @time_sheet.started
#     click_on "Clock In"
#
#     assert_text "Time sheet was successfully created"
#     click_on "Back"
#   end

  focus
  test "updating a Time sheet" do
    # binding.pry
    visit time_sheets_url(@time_sheet)
    click_on "Edit", match: :first
    #
    fill_in "Clock in", with: @time_sheet.clock_in
    # # check "Started" if @time_sheet.started
    # click_on "Clock In"
    #
    # assert_text "Time sheet was successfully updated"
    # click_on "Back"
  end

  # test "destroying a Time sheet" do
  #   visit time_sheets_url
  #   page.accept_confirm do
  #     click_on "Destroy", match: :first
  #   end
  #
  #   assert_text "Time sheet was successfully destroyed"
  # end
end
