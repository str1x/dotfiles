{
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "bottom";
        position = "bottom";

        modules-left = ["tray" "clock" "hyprland/language"];

        modules-center = ["hyprland/workspaces"];

        modules-right = [
          "cpu"
          "memory"
          "temperature#cpu"
          "temperature#cpu-ccd1"
          "temperature#cpu-ccd2"
          "temperature#gpu"
          "temperature#gpu-junction"
          "temperature#gpu-mem"
          "temperature#nvme"
          "temperature#mem-1"
          "temperature#mem-2"
        ];

        "hyprland/workspaces" = {
          show-special = true;
        };

        "hyprland/language" = {
          format = "{}";
          format-en = "EN";
          format-ru = "RU";
        };

        cpu = {
          interval = 30;
          format = "  {}%";
          max-length = 10;
        };

        memory = {
          interval = 30;
          format = "  {}%";
          max-length = 10;
        };

        "temperature#cpu" = {
          hwmon-path = "/sys/class/hwmon/hwmon3/temp1_input";
          critical-threshold = 90;
          format = "  {temperatureC}°C";
          tooltip = true;
          tooltip-format = "Tctl";
        };

        "temperature#cpu-ccd1" = {
          hwmon-path = "/sys/class/hwmon/hwmon3/temp3_input";
          critical-threshold = 80;
          format = "  {temperatureC}°C";
          tooltip = true;
          tooltip-format = "Tccd1";
        };

        "temperature#cpu-ccd2" = {
          hwmon-path = "/sys/class/hwmon/hwmon3/temp4_input";
          critical-threshold = 80;
          format = "  {temperatureC}°C";
          tooltip = true;
          tooltip-format = "Tccd2";
        };

        "temperature#gpu" = {
          hwmon-path = "/sys/class/hwmon/hwmon0/temp1_input";
          critical-threshold = 85;
          format = "󰤽  {temperatureC}°C";
          tooltip = true;
          tooltip-format = "GPU edge";
        };

        "temperature#gpu-junction" = {
          hwmon-path = "/sys/class/hwmon/hwmon0/temp2_input";
          critical-threshold = 95;
          format = "  {temperatureC}°C";
          tooltip = true;
          tooltip-format = "GPU junction";
        };

        "temperature#gpu-mem" = {
          hwmon-path = "/sys/class/hwmon/hwmon0/temp3_input";
          critical-threshold = 80;
          format = "  {temperatureC}°C";
          tooltip = true;
          tooltip-format = "GPU mem";
        };

        "temperature#nvme" = {
          hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 60;
          format = "󰋊  {temperatureC}°C";
          tooltip = true;
          tooltip-format = "nvme";
        };

        "temperature#mem-1" = {
          hwmon-path = "/sys/class/hwmon/hwmon4/temp1_input";
          critical-threshold = 60;
          format = "  {temperatureC}°C";
          tooltip = true;
          tooltip-format = "RAM 1";
        };

        "temperature#mem-2" = {
          hwmon-path = "/sys/class/hwmon/hwmon5/temp1_input";
          critical-threshold = 60;
          format = "  {temperatureC}°C";
          tooltip = true;
          tooltip-format = "RAM 2";
        };
      }
    ];
  };
}
