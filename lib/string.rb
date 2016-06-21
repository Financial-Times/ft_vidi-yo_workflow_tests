# frozen_string_literal: true
class String

  def contains_uuid?
    !!(self =~ /[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]/)
  end

end
