$:.unshift File.expand_path(File.join(File.dirname(__FILE__), 'lib'))

require 'test/unit'
require 'lxc'

class TestLXCUndefined < Test::Unit::TestCase
  def setup
    @name = 'test_undefined'
    @container = LXC::Container.new(@name)
  end

  def test_container_config_file_name
    lxc_path = LXC.global_config_item('lxc.lxcpath')
    config_path = File.join(lxc_path, @name, 'config')
    assert_equal(config_path, @container.config_file_name)
  end

  def test_container_not_defined
    assert(!@container.defined?)
  end

  def test_container_init_pid
    assert_nil(@container.init_pid)
  end

  def test_container_not_running
    assert(!@container.running?)
  end

  def test_container_stopped
    assert_equal(:stopped, @container.state)
  end
end
