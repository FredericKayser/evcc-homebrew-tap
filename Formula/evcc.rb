# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.114.1"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.114.1/evcc_0.114.1_macOS-all.tar.gz"
    sha256 "2b2ac8d7ccb94d71d5745a2e30c4c17a46cd67a3ca14b5f504e298fd2fe1e8a2"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.114.1/evcc_0.114.1_linux-armhf.tar.gz"
      sha256 "07f914dcbd444303754dc4edd7732098d8aadb6128b1937dc933960ca700e2c2"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.114.1/evcc_0.114.1_linux-amd64.tar.gz"
      sha256 "9dd6d9d8b2a1cbc72c8bcea3f0adb73e340b3970c52feb435003bf67606ec10f"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.114.1/evcc_0.114.1_linux-arm64.tar.gz"
      sha256 "620f1311bee37adaa531b20e48cc28d1dec08abc4b007631893b962d6fe590ca"

      def install
        bin.install "evcc"
      end
    end
  end

  plist_options startup: false

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>#{plist_name}</string>
    <key>Program</key>
    <string>#{bin}/evcc</string>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>StandardOutPath</key>
    <string>#{var}/log/evcc.log</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/evcc.log</string>
  </dict>
</plist>

    EOS
  end

  test do
    system "#{bin}/evcc --version"
  end
end
