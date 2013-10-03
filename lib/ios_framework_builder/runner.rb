module IOSFrameworkBuilder
  class Runner
    def prevent_recursive_calls!
      exit(0) if ENV[__FILE__] ; ENV[__FILE__] = '1'
    end

    def run
      builder = Builder.new
      frameworker = Frameworker.new builder.name, builder.symroot
      smasher = Smasher.new
      validator = Validator.new

      builder.call
      frameworker.call
      frameworker.import_headers builder.header_path
      smasher.call builder.binary_paths, frameworker.binary_path

      validator.fat_binary frameworker.binary_path
    end

    def self.call(*args)
      runner = self.new
      runner.prevent_recursive_calls!
      runner.run
    end
  end
end
