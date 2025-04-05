# Image-converter-nodejs

Simple node.js scripts that can convert images to webp or to png

- > webp script will convert: **jpg, jpeg, png, webp** formats to **webp**
- > png script will convert: **jpg, jpeg, png, gif, webp** formats to **png**

## Setup

- Firstly in the project folder run

`npm install`

Or

`yarn install`

- Secondly you might want to create shortcuts to the *sources* and *output* folders as well as to the batch files for ease of use

>[!IMPORTANT]:  Do not move the batch files from the project folder otherwise they will not work!
Shortcuts can be placed anywhere you want.

### Usage

1. Put the images you want to convert into *sources folder*
2. Run the desired script with the batch file or in the project directory [running the scripts manually](#scripts-which-can-be-run-in-project-directory)
3. Enjoy your converted images in the *output folder*

#### Scripts which can be run in project directory

Depending on which script is needed

`npm run png`, `npm run webp`

or

`yarn png`, `yarn webp`
