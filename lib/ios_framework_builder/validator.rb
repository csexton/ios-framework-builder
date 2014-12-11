module IOSFrameworkBuilder
  class Validator
    def fat_binary(path)
      arches = `xcrun lipo -info "#{path}"`
      check_return_code
      look_for_arches arches, path
    end

    private

    def check_return_code
      if $? != 0
        puts "*** VALIDATION FAILED"
        exit 3
      end
    end

    def look_for_arches(arches, path)
      %w{armv7 armv7s arm64 i386 x86_64}.each do |arch|
        if arches.include? arch
          puts "Validated #{arch}"
        else
          puts "#{arch} missing from #{path}"
          exit 3
        end
      end
    end
  end
end
