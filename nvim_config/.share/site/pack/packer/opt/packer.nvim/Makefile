test:
	if [ ! -d ~/.local/share/nvim/site/pack/vendor/start/plenary.nvim ]; \
	then \
		git clone --depth 1 https://github.com/nvim-lua/plenary.nvim \
			~/.local/share/nvim/site/pack/vendor/start/plenary.nvim; \
		ln -f -s "$$(pwd)" ~/.local/share/nvim/site/pack/vendor/start; \
	fi; \
	nvim --headless --noplugin -u tests/minimal.vim \
		-c "PlenaryBustedDirectory tests/ {minimal_init = 'tests/minimal.vim'}"
