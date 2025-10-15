# frozen_string_literal: true

require "test_helper"

class HPCKit::Slurm::SbatchParserTest < Minitest::Test
  def test_minutes_to_minutes
    assert_equal 123, HPCKit::Slurm::SbatchParser.parse_time("123")
  end

  def test_seconds_to_minutes
    assert_equal 1, HPCKit::Slurm::SbatchParser.parse_time("0:2")
  end

  def test_minutest_seconds_to_minutes
    assert_equal 2, HPCKit::Slurm::SbatchParser.parse_time("1:2")
  end

  def test_hours_minutest_seconds_to_minutes
    assert_equal 60 + 2 + 1, HPCKit::Slurm::SbatchParser.parse_time("1:2:3")
  end

  def test_day_hours_to_minutes
    assert_equal (24 + 2) * 60, HPCKit::Slurm::SbatchParser.parse_time("1-2")
  end

  def test_day_hours_minutes_to_minutes
    assert_equal (24 + 2) * 60 + 3, HPCKit::Slurm::SbatchParser.parse_time("1-2:3")
  end

  def test_day_hours_minutes_seconds_to_minutes
    assert_equal (24 + 2) * 60 + 3 + 1, HPCKit::Slurm::SbatchParser.parse_time("1-2:3:4")
  end
end
