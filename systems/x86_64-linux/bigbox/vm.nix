{ ... }: {
  virtualisation.vmVariant = {
    services.qemuGuest.enable = true;
    boot = {
      kernelParams =
        [ "nosplash" "systemd.show_status=true" "systemd.log_level=debug" ];
    };
    virtualisation = {
      qemu.options = [
        "-enable-kvm"
        "-display gtk,gl=on,zoom-to-fit=on,grab-on-hover=on"
        "-device virtio-vga-gl"
        "-device usb-mouse"
        "-device usb-tablet"
        "-device usb-kbd"
      ];
      diskSize = 16000;
      memorySize = 4096;
      cores = 4;
      writableStoreUseTmpfs = false;
    };
  };

  programs.virt-manager.enable = true;
}
