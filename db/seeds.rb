# Seeds idempotents : on peut les rejouer autant de fois qu'on veut (bin/rails db:seed)
# sans créer de doublons, grâce à find_or_create_by!.

workshops = [
  { title: "Initiation à la céramique", duration_minutes: 120, published: true,
    description: "Modelage à la main et premier passage au tour. Tout le matériel est fourni." },
  { title: "Réparer son vélo", duration_minutes: 90, published: true,
    description: "Crevaison, freins, dérailleur : les réparations qu'on peut faire soi-même." },
  { title: "Cuisine japonaise : les makis", duration_minutes: 150, published: true,
    description: "Préparer le riz, rouler les makis, découvrir les bases de l'assaisonnement." },
  { title: "Couture : ourlets et boutons", duration_minutes: 60, published: true,
    description: "Les retouches du quotidien, à la main puis à la machine." },
  { title: "Photographier avec son téléphone", duration_minutes: 90, published: false,
    description: "Lumière, cadrage et retouche, sans rien acheter de plus." },
  { title: "Compost et jardinage urbain", duration_minutes: 120, published: false,
    description: "Démarrer un compost sur un balcon et faire pousser des aromatiques." }
]

workshops.each do |attributes|
  Workshop.find_or_create_by!(title: attributes[:title]) do |workshop|
    workshop.assign_attributes(attributes)
  end
end

puts "#{Workshop.count} ateliers"
