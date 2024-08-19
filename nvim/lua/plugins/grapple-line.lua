return {
	"will-lynas/grapple-line.nvim",
	dependencies = {
		"cbochs/grapple.nvim",
	},
	version = "1.x",
	opts = {
		show_names = true,
		overflow = "ellipsis",
		always_show_parent = { "mod.rs", "tests.rs", "init.lua" },
	},
}
