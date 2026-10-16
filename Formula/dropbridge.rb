# Homebrew formula. Lives in github.com/Aayushkalikote/homebrew-tap as Formula/dropbridge.rb.
class Dropbridge < Formula
  desc "Show Android phones in macOS AirDrop and receive Quick Share on your Mac"
  homepage "https://github.com/Aayushkalikote/DropBridge"
  # Prebuilt universal binary from the GitHub release, so users need no Rust toolchain.
  url "https://github.com/Aayushkalikote/DropBridge/releases/download/v0.1.0/dropbridge-v0.1.0-macos-universal.tar.gz"
  sha256 "fb6f1631feab9db8628605f7cd14e15ad58df6937bf861ab6045dfbe9018c6aa"
  license "GPL-3.0-only"

  head do
    url "https://github.com/Aayushkalikote/DropBridge.git", branch: "main"
    depends_on "protobuf" => :build # rqs_lib generates its protocol code with protoc
    depends_on "rust" => :build
  end

  depends_on :macos

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "dropbridge"
    end
  end

  service do
    run [opt_bin/"dropbridge"]
    keep_alive true
    process_type :interactive
    log_path var/"log/dropbridge.log"
    error_log_path var/"log/dropbridge.log"
  end

  def caveats
    <<~EOS
      Start it now and at every login:
        brew services start dropbridge

      On the phone: same Wi-Fi, Quick Share → Everyone. Then check with:
        dropbridge doctor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dropbridge --version")
  end
end
