module MioExceptions

  class ObjectIsNotAPageException < StandardError; end

  # Thrown when an expected page accessor is not found
  class PageElementSelectorNotFoundException < StandardError

    def initialize(missing_object = 'Unknown', message = nil)
      @message = message
      @missing_object = missing_object
      @default_message = "#{@missing_object} missing from page"
    end

    def to_s
      @message || @default_message
    end

  end

  # Thrown when an expected method is not found in a page object
  class ExpectedCapabilityNotFound < StandardError

    def initialize(missing_capability = 'Unknown', message = nil)
      @missing_capability = missing_capability
      @message = message
      @default_message = "#{@missing_capability} expected, not found"
    end

    def to_s
      @message || @default_message
    end
  end

  class AttributeNotFoundException < StandardError; end

  class InvalidObjectType < StandardError; end

  class ExpectedAttributeNotFoundError < StandardError

    def initialize(expected_attribute='Unknown', message=nil)
      @expected_attribute = expected_attribute
      @message = message
      @default_message = "Expected attirbute #{expected_attribute} not found."
    end

    def to_s
      @message || @default_message
    end
  end

end
