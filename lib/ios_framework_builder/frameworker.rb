require 'fileutils'
module IOSFrameworkBuilder
  class Frameworker
    attr_reader :name, :destination
    def initialize(name, destination_path)
      @name = name
      @destination = destination_path
    end

    def binary_path
      "#{dir}/Versions/A/#{name}"
    end

    def import_headers(header_source_dir)
      FileUtils.cp_r Dir["#{header_source_dir}/*"], "#{dir}/Versions/A/Headers", :preserve => true
    end

    def import_resources(resource_source_dir)
      FileUtils.cp_r Dir["#{resource_source_dir}/*"], "#{dir}/Versions/A/Resources", :preserve => true
    end

    def call
      FileUtils.mkdir_p "#{dir}/Versions/A/Headers", :verbose => true
      FileUtils.mkdir_p "#{dir}/Versions/A/Resources", :verbose => true
      FileUtils.ln_sf "A", "#{dir}/Versions/Current"
      FileUtils.ln_sf "Versions/Current/Headers", "#{dir}/Headers"
      FileUtils.ln_sf "Versions/Current/#{name}", "#{dir}/#{name}"
      FileUtils.ln_sf "Versions/Current/Resources", "#{dir}/Resources"
    end

    private

    def dir
      "#{destination}/#{name}.framework"
    end
  end
end
