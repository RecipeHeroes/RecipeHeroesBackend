//const cds = require('@sap/cds')

/**
 * Hier findet die Implementierung von Geschäftslogik statt. Wir haben zwei Funktionen, 
 * die wir implementiert haben: Die Likes und the Subscribes. 
 * Anders als in den Service-Definitionen haben wir hier nicht reine OData-REST Schnittstellen.
 * Bei diesen Serviceimplementierungen handelt es sich um POST Abfragen, die spezielle Eingabeparameter
 * erfordern und Rückgabewerte geben können.
 */

module.exports = cds.service.impl(async function () {

    /**
     * Bei einem Like wird das Feld "Recipe_ID" und "Member_Email" angefordert. Es wird
     * ohne weitere Informationen ein "Like"-Eintrag (Type=1) in der Datenbank angelegt und eine
     * Rückmeldung mittgegeben.
     */
    this.on('Like', async (req) => {
        console.log(cds.entities);
        const { RecipeMember } = cds.entities;

        console.log('test')
        const {Recipe_ID, Member_Email} = req.data;
        console.log(Recipe_ID)
        console.log(Member_Email);

        let likeEntry = await cds.run (INSERT.into (RecipeMember) .columns (
            'Recipe_ID', 'Author_Email', 'Type'
        ) .values (
            Recipe_ID, Member_Email, 1
        ));

        return {
            type: 'succeeded',
            message: 'successfully liked recipe'
        };
    });

    /**
     * Bei einem Like wird das Feld "Recipe_ID" und "Member_Email" angefordert. Es wird
     * ohne weitere Informationen ein "Subscripe"-Eintrag in der Datenbank angelegt (Type=2) und eine
     * Rückmeldung mittgegeben.
     */
    this.on('Subscribe', async (req) => {
        const { RecipeMember } = cds.entities;

        console.log('test')
        const {Recipe_ID, Member_Email} = req.data;
        console.log(Recipe_ID)
        console.log(Member_Email);

        let likeEntry = await cds.run (INSERT.into (RecipeMember) .columns (
            'Recipe_ID', 'Author_Email', 'Type'
        ) .values (
            Recipe_ID, Member_Email, 2
        ));

        return {
            type: 'succeeded',
            message: 'successfully subscribed recipe'
        };
    });
});