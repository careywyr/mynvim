# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a LazyVim Neovim configuration - a starter template for [LazyVim](https://github.com/LazyVim/LazyVim), which provides a pre-configured Neovim setup with sensible defaults. LazyVim uses [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Architecture

### Entry Point
- `init.lua` - Bootstraps lazy.nvim by requiring `config.lazy`

### Configuration Structure
- `lua/config/lazy.lua` - Plugin manager setup and lazy.nvim configuration
- `lua/config/options.lua` - Neovim options (extends LazyVim defaults)
- `lua/config/keymaps.lua` - Custom keybindings (extends LazyVim defaults)
- `lua/config/autocmds.lua` - Autocommands (extends LazyVim defaults)

### Plugin Management
- `lua/plugins/*.lua` - Each file is automatically loaded by lazy.nvim
  - Use these files to add plugins, disable LazyVim plugins, or override plugin configurations
  - See `lua/plugins/example.lua` for configuration patterns (currently disabled)

### Key Configuration Files
- `stylua.toml` - Lua code style: 2-space indent, 120 column width
- `.neoconf.json` - Neodev and lua_ls settings for Neovim Lua development

## Lua Code Style

Format Lua code with:
```bash
stylua %
```

Configuration: 2 spaces indentation, 120 character line width.

## Adding/Modifying Plugins

Plugin specifications go in `lua/plugins/` directory:

1. **Add a new plugin**: Create a new file or add to existing plugin spec
2. **Disable a LazyVim plugin**: `{ "plugin/name", enabled = false }`
3. **Override plugin options**: Use `opts` function to extend defaults
4. **Use LazyVim extras**: `{ import = "lazyvim.plugins.extras.lang.<language>" }`

## Default Configurations

LazyVim provides extensive defaults that are always loaded:
- Default options: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
- Default autocmds: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

To remove default autocmds: `vim.api.nvim_del_augroup_by_name("lazyvim_<group_name>")`

## LazyVim Extras

Import language/feature extras for pre-configured setups:
```lua
{ import = "lazyvim.plugins.extras.lang.typescript" }
{ import = "lazyvim.plugins.extras.lang.json" }
{ import = "lazyvim.plugins.extras.ui.mini-starter" }
```
