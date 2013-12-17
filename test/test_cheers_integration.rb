require_relative 'helper'

class TestCheersIntegration < MiniTest::Unit::TestCase

  def test_a_name_content
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("brian")
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Thanks, BRIAN
Give me a.. B
Give me a.. R
Give me an.. I
Give me an.. A
Give me a.. N
BRIAN's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_a_name_a_different_way_order
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("brian")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_includes_in_order shell_output, "Give me a.. B", "Give me a.. R", "Give me an.. I", "Give me an.. A", "Give me a.. N", "BRIAN's just GRAND!"
  end

  def test_a_different_name_with_staggered_step_caps_name_content
      shell_output = ""
      IO.popen('ruby cheers.rb', 'r+') do |pipe|
        pipe.puts("bRiAnThReLkElD")
        pipe.close_write
        shell_output = pipe.read
      end
      expected_output = <<EOS
What's your name?
Thanks, BRIANTHRELKELD
Give me a.. B
Give me a.. R
Give me an.. I
Give me an.. A
Give me a.. N
Give me a.. T
Give me a.. H
Give me a.. R
Give me an.. E
Give me a.. L
Give me a.. K
Give me an.. E
Give me a.. L
Give me a.. D
BRIANTHRELKELD's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

def test_a_full_name_with_a_space
      shell_output = ""
      IO.popen('ruby cheers.rb', 'r+') do |pipe|
        pipe.puts("Brian Threlkeld")
        pipe.close_write
        shell_output = pipe.read
      end
      expected_output = <<EOS
What's your name?
Thanks, BRIAN THRELKELD
Give me a.. B
Give me a.. R
Give me an.. I
Give me an.. A
Give me a.. N
BRIAN THRELKELD's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_a_name_with_a_hyphen
      shell_output = ""
      IO.popen('ruby cheers.rb', 'r+') do |pipe|
        pipe.puts("Brian-Bob")
        pipe.close_write
        shell_output = pipe.read
      end
      expected_output = <<EOS
What's your name?
Thanks, BRIAN-BOB
Give me a.. B
Give me a.. R
Give me an.. I
Give me an.. A
Give me a.. N
Give me a.. B
Give me an.. O
Give me a.. B
BRIAN-BOB's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

end