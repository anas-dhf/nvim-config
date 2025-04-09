# Simple NVIM Config

Just to clarify that all you need to do is to replace the init.lua file located in ~/.config/nvim/init.lua

If the file didn't exist before, just place it there.

Now type in the following commands in the Terminal (adapt based on your package manager - we're using APT for this example):

$ git clone https://github.com/scottmckendry/cyberdream.nvim.git ~/.local/share/nvim/site/pack/packer/start/cyberdream.nvim

$ git clone https://github.com/nvim-neo-tree/neo-tree.nvim.git ~/.local/share/nvim/site/pack/packer/start/neo-tree.nvim

Start nvim using the "nvim" command in the bash.

Write the following:

:PackerCompile

:PackerSync

Congrats!
