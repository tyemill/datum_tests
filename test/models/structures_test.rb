require 'test_helper'

class StructuresTest < ActiveSupport::TestCase
  Is = Plan9::ImprovedStruct.new(:first_name, :last_name)
  Im = Plan9::ImmutableStruct.new(:first_name, :last_name)
  H = "Homer"; S = "Simpson"; M = "Marge"; W = "Wiggum"

  test "improved struct should assign via hash" do
    setup_improved Is
  end

  test "immutable struct should assign via hash" do
    setup_improved Im
  end

  test "improved struct should update" do
    i = setup_improved Is
    i.first_name = M
    assert_equal M, i.first_name
    assert_equal S, i.last_name
  end

  test "immutable struct should NOT update" do
    i = setup_improved Im
    assert_raises NoMethodError do
      i.first_name = M
    end
    assert_equal H, i.first_name
  end

  test "structs should use advanced dup" do
    i = setup_improved Is
    check_advanced_dup i
    im = setup_improved Im
    check_advanced_dup im
  end

private
  def check_advanced_dup i
    h = i.dup({last_name: W})
    assert_equal H, h["first_name"]
    assert_equal W, h["last_name"]
  end

  def setup_improved klass
    i = klass.new({last_name: S, first_name: H})
    assert_equal H, i.first_name
    assert_equal S, i.last_name
    i
  end
end