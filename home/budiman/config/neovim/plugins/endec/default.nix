{ pkgs, ... }:
{
  config = {
    extraPlugins = [ pkgs.unstable.vimPlugins.endec-nvim ];

    extraConfigLua = ''
      require('endec').setup({
        keymaps = {
          defaults = false,
          decode_base64_popup = "<Leader>bd",
          vdecode_base64_popup = "<Leader>bd",
          encode_base64_inplace = "<Leader>be",
          vencode_base64_inplace = "<Leader>be",
        }
      })
    '';
  };
}
