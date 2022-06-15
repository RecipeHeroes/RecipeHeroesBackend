namespace recipeheroes;

entity Recipe {
    key ID: UUID;
    Title : String;
    Description : String;
    Difficulty : Integer enum {
        easy = 1;
        medium = 2;
        hard = 3;
    } not null;
    DurationMinutes : Integer not null;
    Portions : Integer not null default 1;
    Ratings : Association to many Rating on Ratings.Recipe = $self;
    Author: Association to Member;
    Members : Association to many RecipeMember on Members.Recipe = $self;
    Tags : Association to many RecipeTag on Tags.Recipe = $self;
    Incredients : Association to many RecipeIncredient on Incredients.Recipe = $self;
    Attachments : Association to many Attachment on Attachments.Recipe = $self;
    Cookbooks : Association to many RecipeCookbook on Cookbooks.Recipe = $self;
}

entity Rating {
    key ID: UUID;
    Title: String;
    Rating: Integer;
    Comment: String;
    Recipe: Association to Recipe;
    Author: Association to Member;
}

entity Member {
    key Email: String not null;
    Username: String not null;
    LoginTimestamp: Timestamp default $now;
    RegisterTimestamp: Timestamp default $now;
    IsModerator: Boolean not null default false;
    Password: String not null default '';
    Settings: String default '{}';
    Ratings : Association to many Rating on Ratings.Author = $self;
    Recipes : Association to many Recipe on Recipes.Author = $self;
}

entity RecipeMember {
    key ID : UUID;
    Recipe: Association to Recipe;
    Author: Association to Member;
    Timestamp: Timestamp default $now;
    Type: Integer enum {
        like = 1;
        subscription = 2;
    };
}

entity Tag {
    key ID: UUID;
    Title: String not null;
    Description: String;

    Recipes : Association to many RecipeTag on Recipes.Tag = $self;
    Cookbooks : Association to many CookbookTag on Cookbooks.Tag = $self;

}

entity RecipeTag {
    Recipe: Association to Recipe;
    Tag: Association to Tag;
}

entity CookbookTag {
    Cookbook: Association to Cookbook;
    Tag: Association to Tag;
}

entity Incredient {
    key ID : UUID;
    Title: String not null;
    Description: String;
    Recipes : Association to many RecipeIncredient on Recipes.Incredient = $self;
}

entity RecipeIncredient {
    Recipe: Association to Recipe;
    Incredient: Association to Incredient;
}

entity Attachment {
    key ID: UUID;
    Type : Integer enum {
        video = 1;
        image = 2;
    };
    Recipe: Association to Recipe;
}

entity Cookbook {
    key ID : UUID;
    Title: String not null;
    Description: String not null;
    Recipes : Association to many RecipeCookbook on Recipes.Cookbook = $self;
    Author: Association to Member;
    Members : Association to many CookbookMember on Members.Cookbook = $self;
    Tags : Association to many CookbookTag on Tags.Cookbook = $self;

    Parent: Association to Cookbook;
    Child: Association to many Cookbook on Child.Parent = $self;
}

entity RecipeCookbook {
    Recipe: Association to Recipe;
    Cookbook: Association to Cookbook;
}

entity CookbookMember {
    Cookbook: Association to Cookbook;
    Subscriber: Association to Member;
    Timestamp: Timestamp default $now;
    Type: Integer enum {
        like = 1;
        subscription = 2;
    };
}