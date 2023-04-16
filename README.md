<p align="center">
  <h1 align="center">definition-or-references.nvim</h2>
</p>

<p align="center">
    Replace `vim.lsp.buf.definition` and `vim.lsp.buf.references` with single command.
</p>

<div align="center">
    > Drag your video (<10MB) here to host it for free on GitHub.
</div>

<div align="center">

> Videos don't work on GitHub mobile, so a GIF alternative can help users.

_[GIF version of the showcase video for mobile users](SHOWCASE_GIF_LINK)_

</div>

## ⚡️ Description 

This plugin implements JetBrains like definition and references handling (in JetBrains it's called `declaration or usages`). It combines
`vim.lsp.buf.definition` and `vim.lsp.buf.references` into single command `require("definition-or-references").definition_or_references`.
Tested with `tsserver` and `luals`

## ⚡️ How it works?

tldr; When you are NOT on the definition of the item, then this command puts your cursor on the definition,
      and when you are on the definition it shows you all the item's references.

In detail:
This is exact way that this plugin works:
1. At the same time starts two lsp requests `textDocument/definition` and `textDocument/references`.
2. At first it checks `textDocument/definition` result and if:
    a) your cursor is on the definition of the item then it shows you all the item's references
    b) your cursor is not on the definition then it cancells `textDocument/references` request and moves cursor to the definition of an item
3. When handling item's references if there is only one reference it also moves your cursor to that only rerefence.

## 📋 Installation

<div align="center">
<table>
<thead>
<tr>
<th>Package manager</th>
<th>Snippet</th>
</tr>
</thead>
<tbody>
<tr>
<td>

[wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)

</td>
<td>

```lua
-- dev version
use {"KostkaBrukowa/definition-or-references.nvim"}
```

</td>
</tr>
<tr>
<td>

[junegunn/vim-plug](https://github.com/junegunn/vim-plug)

</td>
<td>

```lua
-- dev version
Plug "KostkaBrukowa/definition-or-references.nvim"
```

</td>
</tr>
<tr>
<td>

[folke/lazy.nvim](https://github.com/folke/lazy.nvim)

</td>
<td>

```lua
-- dev version
require("lazy").setup({"KostkaBrukowa/definition-or-references.nvim"})
```

</td>
</tr>
</tbody>
</table>
</div>

## ☄ Getting started

The way to use the plugin is to just make a keymap that calls the plugin e.g.
```lua
vim.keymap.set("n", "gd", require("definition-or-references").definition_or_references, { silent = true })
```
and whenever you call this keymap the logic described above will fire.

## ⚙ Configuration

<details>
<summary>Click to unfold the full list of options with their default values</summary>

> **Note**: The options are also available in Neovim by calling `:h definition-or-references.options`

```lua
require("definition-or-references").setup({
  -- Prints useful logs about what event are triggered, and reasons actions are executed.
  debug = false,

  -- Callback that gets called just before sending first request
  before_start_callback = function() end,

  -- Callback that gets called just after opening entry and settig cursor position
  after_jump_callback = function(_) end,

  -- Callback that gets called with all of the references lsp result. You can do whatever you want
  -- with this data e.g. display it in the `telescope` window
  -- For example see Wiki pages
  on_references_result = nil,
})
```

</details>

## ⌨ Contributing

PRs and issues are always welcome. Make sure to provide as much context as possible when opening one.

## 🗞 Wiki

You can find guides and showcase of the plugin on [the Wiki](https://github.com/jaroslaw.glegola/definition-or-references.nvim/wiki)

## TODO
- [] - some tests
- [] - fix build
