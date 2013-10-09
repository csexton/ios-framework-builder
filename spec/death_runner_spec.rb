require File.join(File.dirname(__FILE__), '..', 'lib', 'ios_framework_builder')

module IOSFrameworkBuilder
  class TestRunner
    include DeathRunner
    def run(c)
      run_or_die(c)
    end
  end

  describe DeathRunner do
    it "bad commands will exit" do
      runner = TestRunner.new
      allow(runner).to receive(:exit)
      runner.run("blargle")
      expect(runner).to have_received(:exit).once
    end

    it "good commands will not exit" do
      runner = TestRunner.new
      allow(runner).to receive(:exit)
      runner.run("echo")
      expect(runner).to_not have_received(:exit)
    end
  end
end
