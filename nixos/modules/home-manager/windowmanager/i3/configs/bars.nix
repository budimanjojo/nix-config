[
  {
    trayOutput = "$monright";
    statusCommand = "py3status";
    fonts = { names = [ "UbuntuMono Nerd Font" ]; size = 12.0; };
    position = "top";
    extraConfig = "strip_workspace_numbers yes";
    colors = {
      background = "$bg-color";
      separator = "$inac-text-color";
      activeWorkspace = {
        border = "$border-color";
        background = "$bg-color";
        text = "$text-color";
      };
      focusedWorkspace = {
        border = "$border-color";
        background = "$bg-color";
        text = "$text-color";
      };
      inactiveWorkspace = {
        border = "$border-color";
        background = "$inac-bg-color";
        text = "$inac-text-color";
      };
      urgentWorkspace = {
        border = "$urgent-bg-color";
        background = "$urgent-bg-color";
        text = "$urgent-text-color";
      };
    };
  }
]
