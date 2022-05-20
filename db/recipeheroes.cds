namespace recipeheroes;

entity Recipe {
    key ID: UUID;
    Title : String;
    Description : String;
    Ratings : Association to many Rating on Ratings.Recipe = $self;
}

entity Rating {
    key ID: UUID;
    Title: String;
    Rating: Integer;
    Comment: String;
    Recipe: Association to Recipe;
}

entity Member {
    key Email: String not null;
    Username: String not null;
    LoginTimestamp: Timestamp default $now;
    RegisterTimestamp: Timestamp default $now;
    IsModerator: Boolean not null default false;
    Password: String not null default '';
    Settings: String default '{}';
}