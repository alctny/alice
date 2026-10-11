-- 以特定字符对齐选中文本

-- default keys
-- insert = "<C-g>s",
-- insert_line = "<C-g>S",
-- normal = "ys",
-- normal_cur = "yss",
-- normal_line = "yS",
-- normal_cur_line = "ySS",
-- visual = "S",
-- visual_line = "gS",
-- delete = "ds",
-- change = "cs",
-- change_line = "cS",
return { "kylechui/nvim-surround", version = "*", event = "VeryLazy", config = true }
