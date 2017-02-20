class ErrorResult
  class << self
    def generate(errors = {})
      res = { errors: [] }

      errors.each_pair do |key,value|
        case value
        when Array
          value.each { |v| res[:errors] << { code: key, message: v } }
        when String
          res[:errors] << { code: key, message: value }
        end
      end

      res
    end
  end
end
