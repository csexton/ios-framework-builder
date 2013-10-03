module IOSFrameworkBuilder
  module DeathRunner
    def run_or_die(cmd)
      puts cmd
      `#{cmd} 2>&1 > /dev/null`
      if $? != 0
        puts "*** BUILD FAILED"
        exit 3
      end
    end
  end
end
