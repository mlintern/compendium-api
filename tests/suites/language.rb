# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# language Unit Tests
class Language < UnitTests
  def test_language_list
    req = @admin.language.list
    assert req.code == 200
  end
end
