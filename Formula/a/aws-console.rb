class AwsConsole < Formula
  desc "Command-line to use AWS CLI credentials to launch the AWS console in a browser"
  homepage "https://github.com/aws-cloudformation/rain"
  url "https://github.com/aws-cloudformation/rain/archive/refs/tags/v1.16.1.tar.gz"
  sha256 "0c73ddedd02317ec2cc80c183c0c60a6fc871aaff58602623d4e17668054aa8f"
  license "Apache-2.0"

  livecheck do
    formula "rain"
  end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "27d432235f9c5db628bbc80ad9c729f693539132ce6aa2c3448db6df9e7d5151"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "546e80b2752153a74167ed67f9aa9d1ff14096137752ece57b1cd226692ca905"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "546e80b2752153a74167ed67f9aa9d1ff14096137752ece57b1cd226692ca905"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "546e80b2752153a74167ed67f9aa9d1ff14096137752ece57b1cd226692ca905"
    sha256 cellar: :any_skip_relocation, sonoma:         "141adbe99d011da18ed41d47fd001784ec8390c2cf2ba44a7994649f8387bc99"
    sha256 cellar: :any_skip_relocation, ventura:        "141adbe99d011da18ed41d47fd001784ec8390c2cf2ba44a7994649f8387bc99"
    sha256 cellar: :any_skip_relocation, monterey:       "141adbe99d011da18ed41d47fd001784ec8390c2cf2ba44a7994649f8387bc99"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "d298ae33284d108c2a3a69f81dc28cf31d9ea20f516983abc34d5928029d35db"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "cmd/aws-console/main.go"
  end

  test do
    # No other operation is possible without valid AWS credentials configured
    output = shell_output("#{bin}/aws-console 2>&1", 1)
    assert_match "a region was not specified. You can run 'aws configure' or choose a profile with a region", output
  end
end
