require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "schedule_invitation" do
    mail = UserMailer.schedule_invitation
    assert_equal "Schedule invitation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
