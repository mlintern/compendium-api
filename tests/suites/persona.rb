# encoding: utf-8
# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/../unit_test')

# Persona Unit Tests
class Persona < UnitTests
  def test_persona_list
    req = @admin.persona.list
    assert req.code == 200
  end
end
