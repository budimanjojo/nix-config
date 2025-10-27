{ pkgs, ... }:
{
  config = {
    extraPlugins = [ pkgs.unstable.vimPlugins.endec-nvim ];

    extraConfigLua = ''
      require('endec').setup({
        keymaps = {
          defaults = false,
          decode_base64_popup = "bd",
          vdecode_base64_popup = "bd",
          encode_base64_inplace = "be",
          vencode_base64_inplace = "be",
        }
      })
    '';
  };
}
