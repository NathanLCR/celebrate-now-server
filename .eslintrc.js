module.exports = {
  root: true,
  env: {
    node: true,
  },
  extends: ["eslint:recommended", "plugin:node/recommended", "prettier", "@rocketseat/eslint-config/node"],
  plugins: ["prettier"],
  rules: {
    "prettier/prettier": "error",
  },
};
