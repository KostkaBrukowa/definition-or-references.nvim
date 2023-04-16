<p align="center">
  <h1 align="center">definition-or-references.nvim</h2>
</p>

<p align="center">
    Replace `vim.lsp.buf.definition` and `vim.lsp.buf.references` with single command.
</p>

<div align="center">
    https://user-images.githubusercontent.com/35625949/232309497-80054f3c-a6a8-431d-81e0-7036e532e425.mov
</div>

<div align="center">

> Videos don't work on GitHub mobile, so a GIF alternative can help users.

_[GIF version of the showcase video for mobile users](https://user-images.githubusercontent.com/35625949/232309658-ca59b473-1e8a-4551-86e4-d3fbe55f6bf6.gif)_
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

<details>
<summary>Packer</summary>

```lua
use {"KostkaBrukowa/definition-or-references.nvim"}
```

</details>

<details>
<summary>vim-plug</summary>

```lua
Plug "KostkaBrukowa/definition-or-references.nvim"
```

</details>

<details>
<summary>lazy.nvim</summary>

```lua
require("lazy").setup({"KostkaBrukowa/definition-or-references.nvim"})
```

</details>

## ☄ Getting started

The way to use the plugin is to just make a keymap that calls the plugin e.g.
```lua
vim.keymap.set("n", "gd", require("definition-or-references").definition_or_references, { silent = true })
```
and whenever you call this keymap the logic described above will fire.

## ⚙ Configuration

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

## ⌨ Contributing

PRs and issues are always welcome. Make sure to provide as much context as possible when opening one.

## 🗞 Wiki

You can find guides and showcase of the plugin on [the Wiki](https://github.com/KostkaBrukowa/definition-or-references.nvim/wiki)

## TODO
- [] - some tests
