//const cds = require('@sap/cds')

module.exports = cds.service.impl(async function () {
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