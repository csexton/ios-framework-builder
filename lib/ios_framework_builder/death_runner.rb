module IOSFrameworkBuilder
  module DeathRunner
    def run_or_die(cmd)
      `#{cmd} 2>&1 > /dev/null`
      if $? != 0
        puts "*** COMMAND FAILED:"
        puts cmd
        exit 3
      end
    end
  end
end
