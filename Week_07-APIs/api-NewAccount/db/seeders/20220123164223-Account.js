'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.bulkInsert('Accounts', [

      {
      accno:101,
      accaname: 'Saving',
      balance: '100000',
      createdAt: new Date(),
      updatedAt: new Date()       

     },

     {

      accno:102,
      accaname: 'Current',
      balance: '150000',
      createdAt: new Date(),
      updatedAt: new Date()        

    },

    {

      accno:103,
      accaname: 'Saving',
      balance: '100000',
      createdAt: new Date(),
      updatedAt: new Date()         

    }

    ], {});
    /**
     * Add seed commands here.
     *
     * Example:
     * await queryInterface.bulkInsert('People', [{
     *   name: 'John Doe',
     *   isBetaMember: false
     * }], {});
    */
  },

  async down (queryInterface, Sequelize) {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
  }
};
