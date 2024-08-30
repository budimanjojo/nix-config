{ inputs, ... }:
{
  # NUR pkgs set (declared in the flake inputs) will be accessible
  # through `pkgs.nur`
  nur = inputs.nur.overlay;

  # The unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through `pkgs.unstable`
  unstable-packages = final: prev: {
    unstable = import inputs.nixpkgs-unstable {
      inherit (final) system;
      config.allowUnfree = true;
    };
  };

  # Your own overlays for nixpkgs should be declared here
  nixpkgs-overlays = final: prev: {
    vimPlugins = prev.vimPlugins // {
      # this version have fzf integration added
      catppuccin-nvim = prev.vimPlugins.catppuccin-nvim.overrideAttrs (oldAttrs: {
        version = "2024-08-20";
        src = prev.fetchFromGitHub {
          owner = "catppuccin";
          repo = "nvim";
          rev = "4fd72a9ab64b393c2c22b168508fd244877fec96";
          sha256 = "sha256-aNmnn7Ym3+OnuvSgpke6rw4AkoVfNCpbjV71JF1c9rs=";
        };
      });
    };
    # talosctl = prev.talosctl.override {
    #   buildGoModule =
    #     args:
    #     prev.buildGoModule (
    #       args
    #       // {
    #         version = "1.5.1";
    #         src = prev.fetchFromGitHub {
    #           owner = "siderolabs";
    #           repo = "talos";
    #           rev = "v1.5.1";
    #           hash = "sha256-HYIk1oZbtcnHLap+4AMwoQN0k44zjiiwDzGcNW+9qqM=";
    #         };
    #         vendorHash = "sha256-Aefwa8zdKWV9TE9rwNA4pzKZekTurkD0pTDm3QfKdUQ=";
    #       }
    #     );
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
  };
}
