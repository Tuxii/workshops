require "test_helper"

class WorkshopTest < ActiveSupport::TestCase
  test "la durée s'affiche en heures et minutes" do
    assert_equal "1 h 30", Workshop.new(duration_minutes: 90).formatted_duration
    assert_equal "1 h", Workshop.new(duration_minutes: 60).formatted_duration
    assert_equal "45 min", Workshop.new(duration_minutes: 45).formatted_duration
    assert_equal "1 h 05", Workshop.new(duration_minutes: 65).formatted_duration
  end

  test "sans durée, rien à afficher" do
    assert_nil Workshop.new.formatted_duration
  end
end
