-- Zig: use the zls that zvm manages instead of Mason's.
-- zls and zig must be built from the same commit on dev builds, and zvm keeps
-- them in lockstep; Mason ships tagged releases that would drift.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        zls = {
          mason = false,
          cmd = { vim.fn.expand("~/.zvm/bin/zls.exe") },
        },
      },
    },
  },
}
