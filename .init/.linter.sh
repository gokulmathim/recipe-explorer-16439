#!/bin/bash
cd /home/kavia/workspace/code-generation/recipe-explorer-16439/food_recipe_explorer_frontend
npm run lint
ESLINT_EXIT_CODE=$?
if [ $ESLINT_EXIT_CODE -ne 0 ]; then
  exit 1
fi

