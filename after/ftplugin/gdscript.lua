local is_windows = vim.fn.has 'win32' == 1

local port = os.getenv 'GDScript_Port' or '6005'

local cmd
if is_windows then
  cmd = { 'ncat', '--no-shutdown', '127.0.0.1', '6005' }
else
  cmd = { 'nc', '127.0.0.1', '6005' }
end

local pipe = [[\\.\pipe\godot.pipe]]

vim.lsp.start {
  name = 'Godot',
  cmd = cmd,
  root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
  on_attach = function(client, bufnr) vim.api.nvim_command([[echo serverstart(']] .. pipe .. [[')]]) end,
}
