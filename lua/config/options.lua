-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Treesitter parsers build with MSVC, but LazyVim's compiler check only globs
-- "Program Files (x86)" for cl.exe and VS 18 installs to "Program Files", so it
-- refuses to build. Put cl.exe on nvim's PATH to satisfy it (version-agnostic).
if vim.fn.has("win32") == 1 and vim.fn.executable("cl") == 0 then
  local pattern = "C:/Program Files/Microsoft Visual Studio/*/*/VC/Tools/MSVC/*/bin/Hostx64/x64/cl.exe"
  local cl = vim.fn.glob(pattern, true, true)[1]
  if cl then
    vim.env.PATH = vim.fs.dirname(cl) .. ";" .. vim.env.PATH
  end
end
