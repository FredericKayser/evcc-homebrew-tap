# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.78"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.78/evcc_0.78_macOS_all.tar.gz"
    sha256 "bad54fa64a5bc8eba9998e59165b82f8365a1f6d63f4129bf87f4d141a380c71"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.78/evcc_0.78_linux_armv6.tar.gz"
      sha256 "6518e92d9f8c0fac34801dfc9b5dc0a9d2e57f8d0f178a1be4a4bbc331e7c211"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.78/evcc_0.78_linux_arm64.tar.gz"
      sha256 "4a4e79c31195c82b4bd24b1d355435062e891633842dedcddfecdbfbf1bd941e"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.78/evcc_0.78_linux_amd64.tar.gz"
      sha256 "e4e84f38ae73aa0c2c4a32cf6e5e06bf8f5047f69eaec56d6b0eb6cce1384869"

      def install
        bin.install "evcc"
      end
    end
  end

  plist_options :startup => false

  def plist; <<~EOS
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
