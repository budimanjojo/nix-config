{ inputs, system, ... }:
final: prev:
{
  # talosctl = prev.talosctl.override {
  #   buildGoModule = args: prev.buildGoModule (args // {
  #     version = "1.5.1";
  #     src = prev.fetchFromGitHub {
  #       owner = "siderolabs";
  #       repo = "talos";
  #       rev = "v1.5.1";
  #       hash = "sha256-HYIk1oZbtcnHLap+4AMwoQN0k44zjiiwDzGcNW+9qqM=";
  #     };
  #     vendorHash = "sha256-Aefwa8zdKWV9TE9rwNA4pzKZekTurkD0pTDm3QfKdUQ=";
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
