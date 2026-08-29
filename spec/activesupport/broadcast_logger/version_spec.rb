require "anonymous_loader"
require "activesupport-broadcast_logger"
# The version spec remains beside the historical runtime path while exercising
# the standalone gemspec version namespace.
# rubocop:disable RSpec/SpecFilePathFormat
RSpec.describe ActiveSupport::BroadcastLogger::Version do
  it_behaves_like "a Version module", described_class

  it "executes the version file for coverage without redefining constants" do
    paths = [
      File.expand_path("../../../lib/activesupport/broadcast_logger/version.rb", __dir__),
      File.expand_path("../../../lib/activesupport/broadcast_logger/version_gem.rb", __dir__)
    ].select { |path| File.file?(path) }
    anonymous_namespace = AnonymousLoader.load(files: paths)

    expect(anonymous_namespace::ActiveSupport::BroadcastLogger::Version::VERSION).to eq(described_class::VERSION)
  end

  it "preserves the BroadcastLogger class namespace" do
    expect(ActiveSupport::BroadcastLogger).to be_a(Class)
  end
end
# rubocop:enable RSpec/SpecFilePathFormat
