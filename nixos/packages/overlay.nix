{ inputs, system, ... }:
final: prev:
{
  wlroots_0_16 = prev.wlroots_0_16.overrideAttrs (old: {
    src = prev.fetchFromGitLab {
      domain = "gitlab.freedesktop.org";
      owner = "wlroots";
      repo = "wlroots";
      rev = "0.16.1";
      hash = "sha256-UyPN7zmytre4emwx/ztZ4JefXHwixPV6UEEqnhSLbIY=";
    };
  });
}
