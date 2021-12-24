module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', 'ce99d0b1c7d942c4b9cc8e0e22996c01'),
  },
});
