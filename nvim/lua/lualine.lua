return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup {
		sections = {
		    lualine_a = {'mode', 'location'},
		    lualine_b = {'branch', 'diff', 'diagnostics'},
		    lualine_c = {'filename', 'filesize'},
		    lualine_x = {'encoding'},
		    lualine_y = {'filetype'},
		    lualine_z = {''}
		},
		options = {
                   component_separators = { left = '/', right = '.' },
		  -- theme = {
		--	   normal = { z = { bg = 'babyblue' } }
		 --  }
		}

	}
    end,
}
