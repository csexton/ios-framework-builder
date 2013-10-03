module IOSFrameworkBuilder
  class Smasher
    include DeathRunner
    def call(binary_paths, framework_binary)
      run_or_die "xcrun lipo -create #{binary_paths.join ' '} -output #{framework_binary}"
    end
  end
end
