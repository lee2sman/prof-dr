// onionring.js is made up of four files - onionring-widget.js, onionring-index.js, onionring-variables.js (this one!), and onionring.css
// it's licensed under the cooperative non-violent license (CNPL) v4+ (https://thufie.lain.haus/NPL.html)
// it was originally made by joey + mord of allium (蒜) house, last updated 2020-11-24

// === ONIONRING-VARIABLES ===
//this file contains the stuff you edit to set up your specific webring

//the full URLs of all the sites in the ring
var sites = [
  'https://faculty.purchase.edu/lee.tusman/',
  'https://students.purchase.edu/julie.zen/now/',
  'https://students.purchase.edu/christian.tapia/',
  'https://students.purchase.edu/macreen.smith/',
  'https://students.purchase.edu/christopher.petrella/',
  'https://students.purchase.edu/michael.parducci/',
  'https://students.purchase.edu/scotia.morris/now/',
  'https://students.purchase.edu/sarah.meyers/',
  'https://students.purchase.edu/brock.mento/me%20page/',
  'https://students.purchase.edu/melissandre.jones/',
  'https://students.purchase.edu/luis.gonzales/',
  'https://students.purchase.edu/YARED.GLICKSMAN/nowam',
  'https://students.purchase.edu/griffin.gagler/now/',
  'https://students.purchase.edu/jose.figueroa/',
  'https://students.purchase.edu/phylip.derival',
  'https://students.purchase.edu/Z.crisostomo/',
  'https://students.purchase.edu/tyler.capossela/'
];

//the name of the ring
var ringName = 'Anti Software Social Club';

/* the unique ID of the widget. two things to note:
 1) make sure there are no spaces in it - use dashes or underscores if you must
 2) remember to change 'webringid' in the widget code you give out and all instances of '#webringid' in the css file to match this value!*/
var ringID = 'social';

//should the widget include a link to an index page?
var useIndex = true;
//the full URL of the index page. if you're not using one, you don't have to specify anything here
var indexPage = 'https://faculty.purchase.edu/anti-software/';

//should the widget include a random button?
var useRandom = true;
