local setup, comment = pcall(require, "nvim_comment")

if not setup then 
    return
end

return comment.setup()
