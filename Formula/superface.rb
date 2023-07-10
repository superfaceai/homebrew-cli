require "language/node"

class Superface < Formula
  desc "Let AI connect the APIs for you"
  homepage "https://github.com/superfaceai/cli"
  url "https://registry.npmjs.org/@superfaceai/cli/-/cli-4.0.0-beta.5.tgz"
  sha256 "3bf710fd07d3748706a6c0ea82bc9059b6a4a9fe495588cf00875da839e8a8c3"
  license "MIT"

  depends_on "node@18" => :build

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]

    deuniversalize_machos
  end

  test do
    # CLI functionalities are dependent on authentication,
    # so we're simply testing the CLI runs
    assert shell_output("#{bin}/superface help").strip.include?("COMMANDS"), "Help should contain COMMANDS section"

    # TODO: We could possibly test `execute` command
  end
end
