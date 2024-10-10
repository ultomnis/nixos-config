{
  qt = {
    enable = true;
    style = "kvantum";
    platformTheme = "qt5ct";
  };

  environment.variables = {
    QT_QUICK_CONTROLS_STYLE = "org.kde.desktop";
  };
}
