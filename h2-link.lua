-- h2-id-hover.lua
function Header(el)
  if el.level == 2 then
    -- Génère un id si inexistant
    if el.identifier == "" then
      el.identifier = pandoc.utils.make_identifier(el.content)
    end

    -- Ajoute un lien '#' vers lui-même (facultatif, visible via CSS)
    local link = pandoc.Link({pandoc.Str("#")}, "#" .. el.identifier)
    table.insert(el.content, pandoc.Space())  -- espace avant le lien
    table.insert(el.content, link)

    return el
  end
end
