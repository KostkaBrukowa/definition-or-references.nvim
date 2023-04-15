<p align="center">
  <h1 align="center">definition-or-references.nvim</h2>
</p>

<p align="center">
    > A catch phrase that describes your plugin.
</p>

<div align="center">
    > Drag your video (<10MB) here to host it for free on GitHub.
</div>

<div align="center">

> Videos don't work on GitHub mobile, so a GIF alternative can help users.

_[GIF version of the showcase video for mobile users](SHOWCASE_GIF_LINK)_

</div>

## ⚡️ Features

> Write short sentences describing your plugin features

- FEATURE 1
- FEATURE ..
- FEATURE N

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
-- stable version
use {"KostkaBrukowa/definition-or-references.nvim", tag = "*" }
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
-- stable version
Plug "KostkaBrukowa/definition-or-references.nvim", { "tag": "*" }
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
-- stable version
require("lazy").setup({{"KostkaBrukowa/definition-or-references.nvim", version = "*"}})
-- dev version
require("lazy").setup({"KostkaBrukowa/definition-or-references.nvim"})
```

</td>
</tr>
</tbody>
</table>
</div>

## ☄ Getting started

> Describe how to use the plugin the simplest way

## ⚙ Configuration

> The configuration list sometimes become cumbersome, making it folded by default reduce the noise of the README file.

<details>
<summary>Click to unfold the full list of options with their default values</summary>

> **Note**: The options are also available in Neovim by calling `:h definition-or-references.options`

```lua
require("definition-or-references").setup({
    -- you can copy the full list from lua/definition-or-references/config.lua
})
```

</details>

## 🧰 Commands

|   Command   |         Description        |
|-------------|----------------------------|
|  `:Toggle`  |     Enables the plugin.    |

## ⌨ Contributing

PRs and issues are always welcome. Make sure to provide as much context as possible when opening one.

## 🗞 Wiki

You can find guides and showcase of the plugin on [the Wiki](https://github.com/jaroslaw.glegola/definition-or-references.nvim/wiki)

## 🎭 Motivations

> If alternatives of your plugin exist, you can provide some pros/cons of using yours over the others.
