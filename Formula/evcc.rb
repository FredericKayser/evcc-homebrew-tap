# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.106.0"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.106.0/evcc_0.106.0_macOS_all.tar.gz"
    sha256 "04dbf087f138507eb8328343d88fcdf21093cc588f6f18880ce11ed6d8c948a8"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.106.0/evcc_0.106.0_linux_armv6.tar.gz"
      sha256 "67947a3f54880a110fa9c3c7682387095c35df7a5e8d4f99e2ab34b763d56df0"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.106.0/evcc_0.106.0_linux_amd64.tar.gz"
      sha256 "3b7cbeea3e2d74d4b8d16368c5af1f71641ddfa463d65c20863e0da8808036e4"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.106.0/evcc_0.106.0_linux_arm64.tar.gz"
      sha256 "b6935b8264e3a27767c65692d155b889789ed68f37f761df849a402d1f4e7f79"

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
