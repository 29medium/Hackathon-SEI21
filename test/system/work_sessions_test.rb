require "application_system_test_case"

class WorkSessionsTest < ApplicationSystemTestCase
  setup do
    @work_session = work_sessions(:one)
  end

  test "visiting the index" do
    visit work_sessions_url
    assert_selector "h1", text: "Work Sessions"
  end

  test "creating a Work session" do
    visit work_sessions_url
    click_on "New Work Session"

    fill_in "Backspace", with: @work_session.backspace
    fill_in "End", with: @work_session.end
    fill_in "Keys", with: @work_session.keys
    fill_in "Last key", with: @work_session.last_key
    fill_in "Pause", with: @work_session.pause
    fill_in "Start", with: @work_session.start
    fill_in "Task", with: @work_session.task_id
    click_on "Create Work session"

    assert_text "Work session was successfully created"
    click_on "Back"
  end

  test "updating a Work session" do
    visit work_sessions_url
    click_on "Edit", match: :first

    fill_in "Backspace", with: @work_session.backspace
    fill_in "End", with: @work_session.end
    fill_in "Keys", with: @work_session.keys
    fill_in "Last key", with: @work_session.last_key
    fill_in "Pause", with: @work_session.pause
    fill_in "Start", with: @work_session.start
    fill_in "Task", with: @work_session.task_id
    click_on "Update Work session"

    assert_text "Work session was successfully updated"
    click_on "Back"
  end

  test "destroying a Work session" do
    visit work_sessions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Work session was successfully destroyed"
  end
end
