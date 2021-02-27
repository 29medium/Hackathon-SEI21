require "test_helper"

class WorkSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_session = work_sessions(:one)
  end

  test "should get index" do
    get work_sessions_url
    assert_response :success
  end

  test "should get new" do
    get new_work_session_url
    assert_response :success
  end

  test "should create work_session" do
    assert_difference('WorkSession.count') do
      post work_sessions_url, params: { work_session: { backspace: @work_session.backspace, end: @work_session.end, keys: @work_session.keys, last_key: @work_session.last_key, pause: @work_session.pause, start: @work_session.start, task_id: @work_session.task_id } }
    end

    assert_redirected_to work_session_url(WorkSession.last)
  end

  test "should show work_session" do
    get work_session_url(@work_session)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_session_url(@work_session)
    assert_response :success
  end

  test "should update work_session" do
    patch work_session_url(@work_session), params: { work_session: { backspace: @work_session.backspace, end: @work_session.end, keys: @work_session.keys, last_key: @work_session.last_key, pause: @work_session.pause, start: @work_session.start, task_id: @work_session.task_id } }
    assert_redirected_to work_session_url(@work_session)
  end

  test "should destroy work_session" do
    assert_difference('WorkSession.count', -1) do
      delete work_session_url(@work_session)
    end

    assert_redirected_to work_sessions_url
  end
end
