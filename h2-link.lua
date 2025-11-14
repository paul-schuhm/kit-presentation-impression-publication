-- Add ids and links to every h2 title to make anchors
-- This script is called by pandoc.
function Header(el)
  if el.level == 2 then
    -- Create an id for each h2
    if el.identifier == "" then
      el.identifier = pandoc.utils.make_identifier(el.content)
    end
    -- Add a link '#' to itself
    local link = pandoc.Link({pandoc.Str("#")}, "#" .. el.identifier)
    table.insert(el.content, pandoc.Space())  -- space before the link
    table.insert(el.content, link)
    return el
  end
end
