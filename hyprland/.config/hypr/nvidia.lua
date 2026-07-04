-- ============================================================
-- ======         NVIDIA ENVIRONMENT VARIABLES           ======
-- ============================================================
-- -- Force Hyprland to use nvidia GPU, and not integrated GPU
hl.env("AQ_DRM_DEVICES", "/dev/dri/card1")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("HYPRCURSOR_GPU", "nvidia")

-- NVIDIA setup
hl.env("__NV_PRIME_RENDER_OFFLOAD", "1")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("__VK_LAYER_NV_optimus", "NVIDIA_only")
