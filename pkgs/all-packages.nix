final: prev: let
  callPackage = final.callPackage or (prev.lib.callPackageWith (prev // packages));

  pkgs =
    if (final != {})
    then final
    else prev;

  inherit (pkgs) fetchFromGitHub;

  packages = {
    bemoji = callPackage ./tools/misc/bemoji {};

    fuzzel-dmenu-shim = callPackage ./tools/wayland/fuzzel-dmenu-shim {};

    glfw-wayland-minecraft = callPackage ./development/libraries/glfw-wayland-minecraft {};

    glfwUnstable = prev.glfw.overrideAttrs (_: {
      src = fetchFromGitHub {
        owner = "glfw";
        repo = "GLFW";
        rev = "62e175ef9fae75335575964c845a302447c012c7";
        sha256 = "sha256-GiY4d7xadR0vN5uCQyWaOpoo2o6uMGl1fCcX4uDGnks=";
      };
    });

    libwlxpw = callPackage ./applications/misc/wlxoverlay/libwlxpw.nix {};

    libwlxshm = callPackage ./applications/misc/wlxoverlay/libwlxpw.nix {};

    run-or-raise = callPackage ./tools/wayland/run-or-raise {};

    screenshot-bash = callPackage ./tools/graphics/screenshot-bash {};

    termapp = callPackage ./tools/wayland/termapp {};

    vesktop = callPackage ./applications/misc/vesktop {};

    wlxoverlay = callPackage ./applications/misc/wlxoverlay {};

    zoom65-udev-rules = callPackage ./os-specific/linux/zoom65-udev-rules {};
  };
in
  packages
