function alacritty-theme --argument theme
  if ! test -f ~/.config/alacritty/themes/colors.yml
    echo "file ~/.config/alacritty/themes/colors.yml doesn't exist"
    return
  end

  # sed doesn't like symlinks, get the absolute path
  set -l config_path (realpath ~/.config/alacritty/themes/colors.yml)

  sed -i "" -e "s#^colors: \*.*#colors: *$theme#g" $config_path

  echo "switched to $theme"
end
