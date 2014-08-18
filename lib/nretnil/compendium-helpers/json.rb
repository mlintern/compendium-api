class String

  def is_json?
    begin
      !!JSON.parse(self)
      true
    rescue
      false
    end
  end

end