using recipeheroes from '../db/recipeheroes';

/*
Dies ist unser Service, der später veröffentlicht wird. Die Zeilen bis
12 zeigen veröffentlichen die in der Datenbank-Definition bestimmten
Entitäten im "RecipeHeroesService".
Es wird zusätzlich ein "struct" namens "response" erstellt. zusätzlich
werden zwei Actions veröffentlicht, die in der Service Implementierung
in der Datei "recipeheroes-service.js" näher bestimmt werden.
*/

service RecipeHeroesService {
    entity Recipe as projection on recipeheroes.Recipe;
    entity Rating as projection on recipeheroes.Rating;
    entity Member as projection on recipeheroes.Member;
    entity RecipeMember as projection on recipeheroes.RecipeMember;
    entity Tag as projection on recipeheroes.Tag;
    entity RecipeTag as projection on recipeheroes.RecipeTag;
    entity CookbookTag as projection on recipeheroes.CookbookTag;
    entity Incredient as projection on recipeheroes.Incredient;
    entity RecipeIncredient as projection on recipeheroes.RecipeIncredient;
    entity Attachment as projection on recipeheroes.Attachment;
    entity Cookbook as projection on recipeheroes.Cookbook
    entity RecipeCookbook as projection on recipeheroes.RecipeCookbook;
    entity CookbookMember as projection on recipeheroes.CookbookMember;

    type response {
        type: String enum { succeeded; failed; };
        message: String;
    }

    action Like (Recipe_ID:String, Member_Email:String) returns response;
    action Subscribe (Recipe_ID:String, Member_Email:String) returns response;

}