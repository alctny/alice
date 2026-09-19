-- system-copy.yazi
--
-- Copy selected/hovered files from Yazi to the macOS system clipboard.
-- The clipboard contains real file URLs, so Finder and other GUI
-- applications can paste the files normally.

local selected_or_hovered = ya.sync(function()
	local tab = cx.active
	local paths = {}

	-- Selected files
	for _, url in pairs(tab.selected) do
		paths[#paths + 1] = tostring(url)
	end

	-- No selection -> hovered file
	if #paths == 0 and tab.current.hovered then
		paths[1] = tostring(tab.current.hovered.url)
	end

	return paths
end)

local function notify(content)
	ya.notify({
		title = "System Clipboard",
		content = content,
		timeout = 2,
	})
end

local function copy_to_macos_clipboard(paths)
	if #paths == 0 then
		return false, "No file selected"
	end

	local script = [[
import AppKit
import Foundation

let paths = Array(CommandLine.arguments.dropFirst())

guard !paths.isEmpty else {
    fputs("No files specified\n", stderr)
    exit(1)
}

let urls = paths.map {
    URL(fileURLWithPath: $0)
}

let pasteboard = NSPasteboard.general

pasteboard.clearContents()

if !pasteboard.writeObjects(urls as [NSURL]) {
    fputs("Failed to write files to pasteboard\n", stderr)
    exit(1)
}
]]

	local child = Command("swift"):arg("-e"):arg(script)

	for _, path in ipairs(paths) do
		child:arg(path)
	end

	local output, err = child:output()

	if not output then
		return false, tostring(err)
	end

	return true
end

return {
	entry = function()
		-- Exit visual selection mode first.
		ya.emit("escape", { visual = true })

		local paths = selected_or_hovered()

		if #paths == 0 then
			notify("No file selected")
			return
		end

		local ok, err = copy_to_macos_clipboard(paths)

		if ok then
			notify(string.format("Copied %d file(s) to system clipboard", #paths))
		else
			notify("Copy failed: " .. tostring(err))
		end
	end,
}
