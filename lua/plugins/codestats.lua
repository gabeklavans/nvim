local token = os.getenv("CODESTATS_API_KEY")
if token == nil then
    token = ""
end
return {
    "gabeklavans/codestats.nvim",
    cond = token ~= "",
    opts = {
        token = token
    },
}
