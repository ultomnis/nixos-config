{
  # Run large language models locally
  services.ollama = {
    enable = true;
    rocmOverrideGfx = "11.0.1";
  };
}
