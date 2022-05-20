using recipeheroes from '../db/recipeheroes';

service RecipeHeroesService {
    entity Recipe as projection on recipeheroes.Recipe;
    entity Rating as projection on recipeheroes.Rating;
}