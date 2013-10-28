module IOSFrameworkBuilder
  class Builder
    include DeathRunner
    attr_accessor :name,
      :build_dir,
      :build_root,
      :configuration,
      :objroot,
      :project_file_path,
      :sdk_name,
      :symroot,
      :target_build_dir

    def initialize
      @name = ENV['PROJECT_NAME']
      @build_dir = ENV['BUILD_DIR']
      @build_root = ENV['BUILD_ROOT']
      @configuration = ENV['CONFIGURATION']
      @objroot = ENV['OBJROOT']
      @project_file_path = ENV['PROJECT_FILE_PATH']
      @sdk_name = ENV['SDK_NAME']
      @symroot = ENV['SYMROOT']
      @target_build_dir = ENV['TARGET_BUILD_DIR']
    end

    def binary_paths
      [binary_path("iphoneos"), binary_path("iphonesimulator")]
    end

    def header_path
      "#{target_build_dir}/#{name}Headers/"
    end

    def call
      os_opts = default_opts.merge({:sdk => "iphoneos#{sdk_version}"})
      xcodebuild os_opts, default_vars

      sim_opts = default_opts.merge({:sdk => "iphonesimulator#{sdk_version}"})
      sim_vars = default_vars.merge({:archs => "i386 x86_64"})
      xcodebuild sim_opts, sim_vars
    end

    private

    def default_vars
      {
        :build_dir => build_dir,
        :objroot => objroot,
        :build_root => build_root,
        :symroot => symroot,
        :only_active_arch => "NO"
      }
    end

    def default_opts
      {
        :project => project_file_path,
        :target => name,
        :configuration => configuration
      }
    end
    def binary_path(sdk)
      "#{build_dir}/#{configuration}-#{sdk}/lib#{name}.a"
    end

    def format_opts(hash)
      hash.map{|k,v| "-#{k} #{v}"}.join(' ')
    end

    def format_vars(hash)
      hash.map{|k,v| "#{k.to_s.upcase}=\"#{v}\""}.join(' ')
    end

    def sdk_version
      sdk_name.match(/([0-9]+.*$)/)[0]
    end

    def xcodebuild(opts, vars)
      run_or_die "/usr/bin/xcodebuild #{format_opts opts} #{format_vars vars} build"
    end
  end
end
