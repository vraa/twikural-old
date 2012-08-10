/*
 * This is the script file used to scrap the Thirukural and convert it to JSON object.
 */

var GM_JQ = document.createElement('script');
GM_JQ.src = 'http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js';
GM_JQ.type = 'text/javascript';
document.getElementsByTagName('head')[0].appendChild(GM_JQ);

var US = document.createElement('script');
US.src = 'http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.3.3/underscore-min.js';
US.type = 'text/javascript';
document.getElementsByTagName('head')[0].appendChild(US);

var BB = document.createElement('script');
BB.src = 'http://cdnjs.cloudflare.com/ajax/libs/backbone.js/0.9.2/backbone-min.js';
BB.type = 'text/javascript';
document.getElementsByTagName('head')[0].appendChild(BB);

/*
  [
    {
      'id': 361,
      'tamil': 'actual kural in tamil',
      'kalaignar': 'kalaignar explanation',
      'muva': 'muva',
      'pops': 'pops explanation',
      'english': 'kural in english',
      'explain': 'english explanation'
    }
  ]

*/
console.clear();

/* identify the kural id */
var u = $($('u')[1]);
//var counter = parseInt(u.find('span').html().replace(/[^\d.]/g, ""));
var counter = parseInt(u.find('a').attr('name'));
console.log(counter);

var Kural = Backbone.Model.extend();
var Kurals = Backbone.Collection.extend({
    model: Kural
});

var twikural = new Kurals;

/* now extract the kurals and convert them into JSON */
var quotes = $('blockquote');
console.log(quotes.length);

var i =0;
for(i=0; i < quotes.length; i+=8){
    var kural = new Kural();
    kural.set('id', counter);
    kural.set('tamil', $(quotes[i]).find('span').html());
    kural.set('kalaignar', $(quotes[i+1]).find('span').html());
    kural.set('muva', $(quotes[i+2]).find('span').html());
    kural.set('pops', $(quotes[i+3]).find('span').html());
    kural.set('english', $(quotes[i+6]).find('span').html());
    kural.set('explain',$(quotes[i+7]).find('span').html());
    twikural.add(kural);
    counter++;
}

console.log(JSON.stringify(twikural));