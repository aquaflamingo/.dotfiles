local status_ok, pilot = pcall(require, "copilot")
if not status_ok then
	print("CO PILOT FAILED TO INIT")
  return
end

pilot.setup {
  suggestion = {
    enabled = true,
    auto_trigger = true,
		debounce = 75,
		keymap = {
      accept = "<leader>a",
      accept_word = false,
      accept_line = false,
      next = "<leader>]",
      prev = "<leader>]",
      dismiss = "<C-]>",
    },
	}
}
