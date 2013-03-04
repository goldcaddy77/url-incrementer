require "url_incrementer/version"

module UrlIncrementer
  class Inc
    attr_accessor :template, :type, :params, :page_size, :start_page, :offset, :page_num, :page_date, :current_url

    def initialize(template, type=:offset, options = {})
      self.template = template
      self.type = type
      self.page_size = options[:page_size]
      self.offset = options[:offset] || 0
      self.page_num = options[:page_num] || 0
      # dates in next version
      # self.page_date = options[:page_date] || DateTime.now 
    end

    def update_counters
      self.page_num += 1
      self.offset += self.page_size
      # self.page_date += 1
    end

    def next
      self.current_url = template % instance_variables_hash
      self.update_counters # must be after the line above because of the initial URL creation
      self.current_url
    end

    def instance_variables_hash
      Hash[instance_variables.map { |name| [name.to_s.gsub('@', '').to_sym, instance_variable_get(name)] } ]
    end
  end
end