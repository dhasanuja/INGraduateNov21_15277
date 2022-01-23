'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.bulkInsert('Books', [

      {

        bookname: 'Boo1',

        authorname: 'Author1',

       createdAt: new Date(),

       updatedAt: new Date()       

     },

     {

      bookname: 'Book2',

      authorname: 'Author2',

      createdAt: new Date(),

      updatedAt: new Date()       

    },

    {

      bookname: 'Book3',

      authorname: 'Author3',

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
