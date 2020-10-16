class Enum
  class << self
    def adicionar_item(key, value)
      @hash ||= {}
      @hash[key] = value
    end

    def const_missing(key)
      @hash[key]
    end

    def each
      @hash.each { |key, value| yield(key, value) }
    end

    def options_for_collection
      options = []
      @hash.each do |key, value|
        options << [I18n.t("enum.attributes.#{name.underscore}.#{key.downcase}").html_safe, value]
      end
      options
    end

    def inverse_options_for_collection
      options_for_collection.map { |option| option.reverse }
    end

    def values
      @hash.map { |_key, value| value.to_s }
    end

    def all
      @hash.map { |_key, value| { key: key, value: value.to_s } }
    end

    def find_name_by_value(param)
      return unless values.include? param.to_s

      each do |key, value|
        return I18n.t("enum.attributes.#{name.underscore}.#{key.downcase}") if value.to_s == param.to_s
      end
    end
  end
end
