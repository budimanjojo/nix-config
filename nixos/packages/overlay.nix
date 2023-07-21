{ inputs, system, ... }:
final: prev:
{
  # talosctl = prev.talosctl.override {
  #   buildGoModule = args: prev.buildGoModule (args // {
  #     version = "1.4.0";
  #     src = prev.fetchFromGitHub {
  #       owner = "siderolabs";
  #       repo = "talos";
  #       rev = "v1.4.0";
  #       hash = "sha256-EJrzq6fChNA1N3TTkwD5/1TdLDso9jGuTgWUG4RwqGA=";
  #     };
  #     vendorHash = "sha256-Thkj8Zhj/HXAnRcFxuCEVd94CMrt8Bsq2FHx6siH6Ww=";
  #   });
  # };
  # nil = prev.nil.overrideAttrs (old: rec {
  #   pname = "nil";
  #   version = "2023-03-01";
  #   src = prev.fetchFromGitHub {
  #     owner = "oxalica";
  #     repo = "nil";
  #     rev = "2023-03-01";
  #     hash = "sha256-HGd/TV8ZHVAVBx+ndrxAfS/Nz+VHOQjNWjtKkkgYkqA=";
  #   };
  #   CFG_RELEASE = version;
  #
  #   cargoDeps = old.cargoDeps.overrideAttrs (_: {
  #     name = "${pname}-vendor.tar.gz";
  #     inherit src CFG_RELEASE;
  #     outputHash = "sha256-0OEX4XxC2lkccFng4bQUoAyFbv1snJT2Ku7tUVbx4BU=";
  #   });
  # });
  # wlroots_0_16 = prev.wlroots_0_16.overrideAttrs (old: {
  #   src = prev.fetchFromGitLab {
  #     domain = "gitlab.freedesktop.org";
  #     owner = "wlroots";
  #     repo = "wlroots";
  #     rev = "0.16.1";
  #     hash = "sha256-UyPN7zmytre4emwx/ztZ4JefXHwixPV6UEEqnhSLbIY=";
  #   };
  # });
}
