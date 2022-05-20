using recipeheroes from '../db/recipeheroes';

service RecipeHeroesService {
    entity Recipe as projection on recipeheroes.Recipe;
    entity Rating as projection on recipeheroes.Rating;
    entity Member as projection on recipeheroes.Member;
    entity RecipeMember as projection on recipeheroes.RecipeMember;
    entity Tag as projection on recipeheroes.Tag;
    entity Incredient as projection on recipeheroes.Incredient;
    entity Cookbook as projection on recipeheroes.Cookbook
}