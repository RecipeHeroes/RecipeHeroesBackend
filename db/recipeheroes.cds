namespace recipeheroes;

entity Recipe {
    key ID: Integer;
    Title : String;
    Description : String;
    Ratings : Association to many Rating on Ratings.Recipe = $self;
}

entity Rating {
    key ID: Integer;
    Title: String;
    Rating: Integer;
    Comment: String;
    Recipe: Association to Recipe;
}