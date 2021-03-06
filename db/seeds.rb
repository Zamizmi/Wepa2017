# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# b1 = Brewery.create name:"Koff", year:1897, active:true
# b2 = Brewery.create name:"Malmgard", year:2001, active:true
# b3 = Brewery.create name:"Weihenstephaner", year:1042, active: true
# b4 = Brewery.create name:"Soul Series", year:2009, active: false
#
# s1 = Style.create name:"American Amber", description:"Primarily a catch all for any beer less than a Dark Ale in color, ranging from amber (duh) to deep red hues. This style of beer tends to focus on the malts, but hop character can range from low to high. Expect a balanced beer, with toasted malt characters and a light fruitiness in most examples. The range can run from a basic ale, to American brewers who brew faux-Oktoberfest style beers that are actually ales instead of lagers.
# "
# s2 =Style.create name:"American Barleywine", description:"Despite its name, a Barleywine (or Barley Wine) is very much a beer, albeit a very strong and often intense beer! In fact, it's one of the strongest of the beer styles. Lively and fruity, sometimes sweet, sometimes bittersweet, but always alcoholic. A brew of this strength and complexity can be a challenge to the palate. Expect anything from an amber to dark brown colored beer, with aromas ranging from intense fruits to intense hops. Body is typically thick, alcohol will definitely be perceived, and flavors can range from dominant fruits to palate smacking, resiny hops.
#
# English varieties are quite different from the American efforts, what sets them apart is usually the American versions are insanely hopped to make for a more bitter and hop flavored brew, typically using American high alpha oil hops. English versions tend to be more rounded and balanced between malt and hops, with a slightly lower alcohol content, though this is not always the case."
# s3 =Style.create name:"American Black Ale", description:"Also referred to as a Black IPA (India Pale Ale) or Cascadian Dark Ale, ales of this style range from dark brown to pitch black and showcase malty and light to moderate roasty notes and are often quite hoppy generally with the use of American hops. Alcohol can range from average to high depending on if the brewery is going for a 'dobule / imperial' version."
# s4 =Style.create name:"American Brown Ale", description:"Spawned from the English Brown Ale, the American version can simply use American ingredients. Many other versions may have additions of coffee or nuts. This style also encompasses 'Dark Ales'. The bitterness and hop flavor has a wide range and the alcohol is not limited to the average either."
# s5=Style.create name:"American Blonde Ale", description:"More or less a creation from the craft-brewery movement, and also reminiscent of the German style Kölsch. Pale straw to deep gold for color. Usually an all malt brew, well attenuated with a lightly malty palate. Most have a subdued fruitiness. Hop character is of the noble variety, or similar, leaving a light to medium bitterness. A balanced beer, light bodied and sometimes lager like.
# "
# Style.create name:"American Dark Wheat Ale", description:"An Americanized version of a Dunkel Weizen, these beers can range within the brown to garnet range. Often cloudy with long-lasting heads. Light to medium body with high level of carbonation. Hop characters will be low to high with some fruitiness from ale fermentation, though most examples use of a fairly neutral ale yeast, resulting in a clean fermentation with little to no diacetyl. Flavors of caramel and toasted malts might be present."
# Style.create name:"American Double / Imperial IPA", description:"Take an India Pale Ale and feed it steroids, ergo the term Double IPA. Although open to the same interpretation as its sister styles, you should expect something robust, malty, alcoholic and with a hop profile that might rip your tongue out. The Imperial usage comes from Russian Imperial stout, a style of strong stout originally brewed in England for the Russian Imperial Court of the late 1700s; though Double IPA is often the preferred name."
# Style.create name:"American Double / Imperial Stout", description:"The American Double Stout gets some of it inspiration from the Russian Imperial Stout. Many of these are barrel aged, mostly in bourbon / whiskey barrels, while some are infused with coffee or chocolate. Alcohol ranges vary, but tend to be quite big, and bigger than traditional Russian Imperial Stouts. Most tend to have cleaner alcohol flavors, higher hop levels, and more residual sweetness. Very full-bodied with rich roasted flavors far surpassing normal stouts.
# "
# Style.create name:"American IPA", description:"The American IPA is a different soul from the reincarnated IPA style. More flavorful than the withering English IPA, color can range from very pale golden to reddish amber. Hops are typically American with a big herbal and / or citric character, bitterness is high as well. Moderate to medium bodied with a balancing malt backbone."
# Style.create name:"American Pale Wheat Ale", description:"An Americanized version of a Hefe Weizen, these beers range within the pale to golden range in color. Reminiscent of a Hefe Weizen in appearance, unless filtered. Long-lasting head with a light to medium body, higher carbonation is proper. German Weizen flavors and aromas of banana esters and clove-like phenols will not be found. Most use a substantial percentage of wheat malt. Hop character will be low to high but most are moderate in bitterness. There may be some fruitiness from ale fermentation though most examples use of a fairly neutral ale yeast, resulting in a clean fermentation with little to no diacetyl.
#
# Often served with a lemon wedge (popularized by Americans), to either cut the wheat or yeast edge, which many either find to be a flavorful snap ... or an insult and something that damages the beer's taste and head retention."
# Style.create name:"American Pale Ale (APA)", description:"Of British origin, this style is now popular worldwide and the use of local ingredients, or imported, produces variances in character from region to region. Generally, expect a good balance of malt and hops. Fruity esters and diacetyl can vary from none to moderate, and bitterness can range from lightly floral to pungent.
# American versions tend to be cleaner and hoppier, while British tend to be more malty, buttery, aromatic and balanced."
# Style.create name:"American Stout", description:"Inspired from English & Irish Stouts, the American Stout is the ingenuous creation from that. Thankfully with lots of innovation and originality American brewers have taken this style to a new level. Whether it is highly hopping the brew or adding coffee or chocolate to complement the roasted flavors associated with this style. Some are even barrel aged in Bourbon or whiskey barrels. The hop bitterness range is quite wide but most are balanced. Many are just easy drinking session stouts as well. "
# Style.create name:"American Porter", description:"Inspired from the now wavering English Porter, the American Porter is the ingenuous creation from that. Thankfully with lots of innovation and originality American brewers have taken this style to a new level. Whether it is highly hopping the brew, using smoked malts, or adding coffee or chocolate to complement the burnt flavor associated with this style. Some are even barrel aged in Bourbon or whiskey barrels. The hop bitterness range is quite wide but most are balanced. Many are just easy drinking session porters as well. "
# Style.create name:"American Strong Ale", description:"Catch all style category for beers from 7.0 percent alcohol by volume and above. Some may even be as high as 25% abv. Characteristics will greatly vary; some have similarities to Barley-wines and Old Ales. Barrel aging is certainly not out of the question."
# Style.create name:"American Wild Ale", description:"Sometimes Belgian influenced, American Wild Ales are beers that are introduced to 'wild' yeast or bacteria, such as: Brettanomyces (Brettanomyces Bruxellensis, Brettanomyces Lambicus or Brettanomyces Anomolus), Pediococcus or Lactobacillus. This introduction may occur from oak barrels that have been previously inoculated, pitched into the beer, or gained from various 'sour mash' techniques. Regardless of which and how, these little creatures often leave a funky calling card that can be quite strange, interesting, pleasing to many, but also often deemed as undesirable by many."
# Style.create name:"Black & Tan", description:"This applies to pre-blended packaged beers, where a brewery will blend a dark ale with a light ale or lager. It's by no means a traditional style of beer, but rather brewers capitalizing on the concept practiced at bars where the beers are physically layered.
# "
# Style.create name:"Chile Beer", description:"Typically basic light colored ales, but sometimes lagers, brewers will add various hot pepper juice, oils, or actual peppers to the beer - jalapeño chiles being the most common pepper used. Hotness can range from a subtle spiciness to palate scorching.
# "
# Style.create name:"Cream Ale", description:"Cream Ales, spawned from the American light lager style, are brewed as an ale though are sometimes finished with a lager yeast or lager beer mixed in. Adjuncts such as corn or rice are used to lighten the body. It is no uncommon for smaller craft brewers to brew all malt Cream Ales. Pale straw to pale gold color. Low hop bittering and some hop aroma though some micros have given the style more of a hop character. Well carbonated and well attenuated.
# "
# Style.create name:"Pumpkin Ale", description:"Often released as a fall seasonal, Pumpkin Ales are quite varied. Some brewers opt to add hand-cut pumpkins and drop them in the mash, while others use puree or pumpkin flavoring. These beers also tend to be spiced with pumpkin pie spices, like: ground ginger, nutmeg, cloves, cinnamon, and allspice. Pumpkin Ales are typically mild, with little to no bitterness, a malty backbone, with some spice often taking the lead. Many will contain a starchy, slightly thick-ish, mouthfeel too. In our opinion, best versions use real pumpkin, while roasting the pumpkin can also add tremendous depth of character for even better results, though both methods are time-consuming and tend to drive brewmasters insane.
# "
# Style.create name:"Rye Beer
# ", description:"Not to be confused with a German Roggenbier, beers that fall into this category contain a notable amount of rye grain in the grist bill. Bitterness tends to be moderate, to allow the often spicy and sour-like rye characteristics to pull through."
# Style.create name:"Wheatwine", description:"A somewhat recent and over-looked American strong ale, the Wheatwine (or Wheat Wine) is akin to a Barleywine in strength, but contains a large portion of wheat malt; upwards of 50%. The wheat provides a soft and fluffy mouthfeel. Color and bitterness varies."
#
# b1.beers.create name:"Iso 3", style_id:s1.id
# b1.beers.create name:"Karhu", style_id:s1.id
# b1.beers.create name:"Tuplahumala", style_id:s1.id
# b2.beers.create name:"Huvila Pale Ale", style_id:s1.id
# b2.beers.create name:"X Porter", style_id:s2.id
# b3.beers.create name:"Hefeweizen", style_id:s2.id
# b3.beers.create name:"Helles", style_id:s3.id
# b4.beers.create name:"Demon's Soul", style_id:s3.id
# b4.beers.create name:"Dark Souls I", style_id:s3.id
# b4.beers.create name:"Dark Souls II", style_id:s4.id
# b4.beers.create name:"Dark Souls III", style_id:s4.id

users = 200           # jos koneesi on hidas, riittää esim 100
breweries = 100       # jos koneesi on hidas, riittää esim 50
beers_in_brewery = 40
ratings_per_user = 30

(1..users).each do |i|
  User.create! username:"user_#{i}", password:"Passwd1", password_confirmation:"Passwd1"
end

(1..breweries).each do |i|
  Brewery.create! name:"Brewery_#{i}", year:1900, active:true
end

bulk = Style.create! name:"Bulk", description:"cheap, not much taste"

Brewery.all.each do |b|
  n = rand(beers_in_brewery)
  (1..n).each do |i|
    beer = Beer.create! name:"Beer #{b.id} -- #{i}", style:bulk
    b.beers << beer
  end
end

User.all.each do |u|
  n = rand(ratings_per_user)
  beers = Beer.all.shuffle
  (1..n).each do |i|
    r = Rating.new score:(1+rand(50))
    beers[i].ratings << r
    u.ratings << r
  end
end
