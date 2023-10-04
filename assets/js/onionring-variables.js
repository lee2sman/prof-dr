// onionring.js is made up of four files - onionring-widget.js, onionring-index.js, onionring-variables.js (this one!), and onionring.css
// it's licensed under the cooperative non-violent license (CNPL) v4+ (https://thufie.lain.haus/NPL.html)
// it was originally made by joey + mord of allium (蒜) house, last updated 2020-11-24

// === ONIONRING-VARIABLES ===
//this file contains the stuff you edit to set up your specific webring

//the full URLs of all the sites in the ring
var sites = [
  'https://faculty.purchase.edu/lee.tusman/',
  'https://students.purchase.edu/KHADIJAH.BOOTHE',
  'http://students.purchase.edu/V.DAMIANMONSALVE/',
  'https://students.purchase.edu/lex.decker',
  'https://students.purchase.edu/BRIANNA-M.DIAZ',
  'https://students.purchase.edu/MORITZ.DRESCH',
  'https://students.purchase.edu/JOSEPH.FRANK',
  'https://students.purchase.edu/DAVID.GARCIA',
  'https://students.purchase.edu/ANTHONY.GOJANI',
  'https://students.purchase.edu/MUHAMMED.HANAN',
  'https://students.purchase.edu/HELEN.HUANG',
  'https://students.purchase.edu/QURAN.LANGSTON',
  'https://students.purchase.edu/SACIA.MATTHEWS',
  'https://students.purchase.edu/ELENA.NEUFELD',
  'https://students.purchase.edu/MARIO.OLMEDO',
  'https://students.purchase.edu/GRANT.RENNER',
  'https://students.purchase.edu/RAVEN.SHAW',
  'https://students.purchase.edu/BRANDON.VASSALLO',
  'https://students.purchase.edu/JUSTIN.WILLIAMS'
];

//the name of the ring
var ringName = 'Social Software Social Club';

/* the unique ID of the widget. two things to note:
 1) make sure there are no spaces in it - use dashes or underscores if you must
 2) remember to change 'webringid' in the widget code you give out and all instances of '#webringid' in the css file to match this value!*/
var ringID = 'social';

//should the widget include a link to an index page?
var useIndex = true;
//the full URL of the index page. if you're not using one, you don't have to specify anything here
var indexPage = 'https://faculty.purchase.edu/lee.tusman/social-software/';

//should the widget include a random button?
var useRandom = true;
