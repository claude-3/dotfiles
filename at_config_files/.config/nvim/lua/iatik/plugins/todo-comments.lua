return {
	"folke/todo-comments.nvim",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local todo_comments = require("todo-comments")

		-- TODO: what else?
		-- HACK: hmmm, this looks a bit funky
		-- BUG:
		-- FIX: this needs fixing
		-- WARN: ???
		-- PERF: fully optimised
		-- TEST:
		-- NOTE: adding a note

		-- set keymaps
		vim.keymap.set("n", "]t", function()
			todo_comments.jump_next()
		end, { desc = "Next todo comment" })

		vim.keymap.set("n", "[t", function()
			todo_comments.jump_prev()
		end, { desc = "Next todo comment" })

		todo_comments.setup()
	end,
}
