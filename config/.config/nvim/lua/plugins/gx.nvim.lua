return {
  "deptno/gx.nvim",
  opts = {
    handlers = {
      n = {
        {
          name = "ai 번역 (단어)",
          ui = "hover",
          handler = function(ctx)
            local token = vim.env.GX_API_KEY
            local url = vim.env.GX_API_URL or "https://litellm.deptno.dev/v1/chat/completions"

            if not token then
              return "GX_API_KEY가 없습니다"
            end

            local text = ctx.matched
            if ctx.mode == "v" then
              text = table.concat(ctx.lines or {}, " ")
            end

            if not text or text == "" then
              return "번역할 텍스트가 없습니다"
            end

            local payload = vim.fn.json_encode({
              model = "ollama/demonbyron/HY-MT1.5-7B:latest",
              messages = {
                {
                  role = "user",
                  content = "Translate the following segment into Korean, without additional explanation.\n\nText:\n"
                    .. text,
                },
              },
              temperature = 0.3,
            })

            local Job = require("plenary.job")
            Job:new({
              command = "curl",
              args = {
                url,
                "-s",
                "-H",
                "Content-Type: application/json",
                "-H",
                "Authorization: Bearer " .. token,
                "-d",
                payload,
              },
              on_exit = function(job, code)
                local output = table.concat(job:result(), "\n")

                vim.schedule(function()
                  local ok, decoded = pcall(vim.fn.json_decode, output)
                  local content = output

                  if ok and decoded and decoded.choices and decoded.choices[1] then
                    local message = decoded.choices[1].message or {}
                    content = message.content or decoded.choices[1].text or output
                  end

                  ctx.ui.show(content)
                end)
              end,
            }):start()
          end,
        },
      },
      v = {
        {
          name = "ai 번역 (선택)",
          ui = "hover",
          handler = function(ctx)
            local token = vim.env.GX_API_KEY
            local url = vim.env.GX_API_URL or "https://litellm.deptno.dev/v1/chat/completions"

            if not token then
              return "GX_API_KEY가 없습니다"
            end

            local text = ctx.matched
            if ctx.mode == "v" then
              text = table.concat(ctx.lines or {}, " ")
            end

            if not text or text == "" then
              return "번역할 텍스트가 없습니다"
            end

            local payload = vim.fn.json_encode({
              model = "ollama/demonbyron/HY-MT1.5-7B:latest",
              messages = {
                {
                  role = "user",
                  content = "Translate the following segment into Korean, without additional explanation.\n\nText:\n"
                    .. text,
                },
              },
              temperature = 0.3,
            })

            local Job = require("plenary.job")
            Job:new({
              command = "curl",
              args = {
                url,
                "-s",
                "-H",
                "Content-Type: application/json",
                "-H",
                "Authorization: Bearer " .. token,
                "-d",
                payload,
              },
              on_exit = function(job, code)
                local output = table.concat(job:result(), "\n")

                vim.schedule(function()
                  local ok, decoded = pcall(vim.fn.json_decode, output)
                  local content = output

                  if ok and decoded and decoded.choices and decoded.choices[1] then
                    local message = decoded.choices[1].message or {}
                    content = message.content or decoded.choices[1].text or output
                  end

                  ctx.ui.show(content)
                end)
              end,
            }):start()
          end,
        },
      },
    },
  },
  keys = {
    {
      "gx",
      "<cmd>Gx<cr>",
      mode = {
        "n",
        "v",
      },
      desc = "gx.nvim",
    },
  },
  dir = "/Users/deptno/workspace/src/github.com/deptno/gx.nvim",
  -- dev = false,
}
