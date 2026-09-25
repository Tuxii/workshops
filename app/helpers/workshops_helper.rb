module WorkshopsHelper
  def publication_badge(workshop)
    if workshop.published?
      tag.span("Publié", class: "badge text-bg-success")
    else
      tag.span("Brouillon", class: "badge text-bg-secondary")
    end
  end
end
