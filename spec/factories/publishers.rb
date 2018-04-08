FactoryBot.define do
  factory :publisher do
    name Faker::Name.name
    description "Nec, purus. Morbi aliquet risus in mi.  Curabitur cursus volutpat neque. Proin posuere mauris ut ipsum. Praesent scelerisque tortor a justo. Quisque consequat libero eu erat. In eros augue, sollicitudin sed, tempus tincidunt, pulvinar a, lectus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas interdum purus id risus. Ut ultricies cursus dui. In nec enim at odio aliquam iaculis. Fusce nisl. Pellentesque sagittis. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean placerat tellus. In semper sagittis enim.  Aliquam risus neque, pretium in, fermentum vitae, vulputate et, massa. Nulla sed erat vel eros ornare venenatis. In hac."
    password "hejmeddig"
    email "forlag@eksempel.dk"
  end
end
