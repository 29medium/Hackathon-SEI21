require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  setup do
    @session = sessions(:one)
  end

  test "visiting the index" do
    visit sessions_url
    assert_selector "h1", text: "Sessions"
  end

  test "creating a Session" do
    visit sessions_url
    click_on "New Session"

    fill_in "Backspace", with: @session.backspace
    fill_in "End", with: @session.end
    fill_in "Keys", with: @session.keys
    fill_in "Last key", with: @session.last_key
    fill_in "Pause", with: @session.pause
    fill_in "Start", with: @session.start
    fill_in "Task", with: @session.task_id
    click_on "Create Session"

    assert_text "Session was successfully created"
    click_on "Back"
  end

  test "updating a Session" do
    visit sessions_url
    click_on "Edit", match: :first

    fill_in "Backspace", with: @session.backspace
    fill_in "End", with: @session.end
    fill_in "Keys", with: @session.keys
    fill_in "Last key", with: @session.last_key
    fill_in "Pause", with: @session.pause
    fill_in "Start", with: @session.start
    fill_in "Task", with: @session.task_id
    click_on "Update Session"

    assert_text "Session was successfully updated"
    click_on "Back"
  end

  test "destroying a Session" do
    visit sessions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Session was successfully destroyed"
  end
end
