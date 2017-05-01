module Beanstream

  class BeanstreamException < StandardError
    attr_reader :code, :category, :message, :http_status_code, :details
    def initialize(code=nil, category=nil, message=nil, http_status_code=nil, details=nil)
      @code = code
      @category = category
      @message = message
      @http_status_code = http_status_code
      @details = details
    end
    
    def is_user_error()
      false
    end
    
    def user_facing_message()
      "There was an error processing your request. Please try again or use a different card."
    end
  end
  
  
  class BusinessRuleException < BeanstreamException
    def initialize(code, category, message, http_status_code, details)
      super(code, category, message, http_status_code, details)
    end
  end
  
  class UnauthorizedException < BeanstreamException
    def initialize(code, category, message, http_status_code, details)
      super(code, category, message, http_status_code, details)
    end
  end
  
  class ForbiddenException < BeanstreamException
    def initialize(code, category, message, http_status_code, details)
      super(code, category, message, http_status_code, details)
    end
  end
  
  class InvalidRequestException < BeanstreamException
    def initialize(code, category, message, http_status_code, details)
      super(code, category, message, http_status_code, details)
    end
    
    def is_user_error()
      if (@category ==1)
        true
      elsif (@category == 3 && code == 52)
        true
      else
        false
      end
    end
    
    def user_facing_message()
      if (is_user_error())
        return @message
      else
        super
      end
    end
    
  end
  
  class InternalServerException < BeanstreamException
    def initialize(code, category, message, http_status_code, details)
      super(code, category, message, http_status_code, details)
    end
  end
  
end
