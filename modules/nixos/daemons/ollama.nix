{
  services.ollama = {
    enable = true;
    acceleration = "rocm";

    loadModels = [
      "qwen2.5-coder"
    ];
  };
}
