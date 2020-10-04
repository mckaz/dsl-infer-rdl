module RDL::Reporting
  require_relative './csv.rb'
  require_relative './sorbet.rb'

  class InferenceReport
    include RDL::Reporting::CSV
    include RDL::Reporting::Sorbet

    class TypeInfo
      attr_accessor :klass, :name, :type, :orig_type, :source_code,
                    :comments
    end

    attr_reader :full_name

    def initialize(full_name = nil)
      RDL::Logging.debug :inference, "MK #{full_name}"
      @full_name = full_name
      @children = {}
      @types = []
    end

    def [](className)
      # TODO: We need to know whether or not each level is a module or class...
      part, parts = className.split '::', 2
      part = part.to_sym

      unless @children.key? part
        child_full_name = @full_name ? "#{@full_name}::" : ''
        child_full_name += part.to_s
        @children[part] = self.class.new(child_full_name)
      end

      return @children[part][parts] if parts

      @children[part]
    end

    def <<(input)
      t = TypeInfo.new

      t.klass       = input[:klass]
      t.name = input[:name]
      t.type        = input[:type]
      t.orig_type   = input[:orig_type]
      t.source_code = input[:source_code]
      t.comments    = input[:comments]

      @types << t
    end

  end

end
