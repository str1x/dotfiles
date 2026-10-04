{ pkgs, ... }:
{
  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
    loadModels = [
      "qwen2.5-coder:14b"
    ];
  };
  services.open-webui = {
    enable = true;
    port = 8083;
  };
}
