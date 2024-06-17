% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Moubin Ali Mohammed
%%%%% NAME: Pierre salama
%%%%% NAME: Roupen Kaloustian
%
% Add the required atomic propositions and rules in the corresponding sections.
% If you put the propositions and rules in the wrong sections, you may lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below
 
%%%%% ATOMIC: product
% Add the atomic propositions for product in this section
product(rog_strix, asus, laptop, 1199, 4.2).
product(legion, lenovo, laptop, 1299, 3.8).
product(blade, razer, laptop, 2499, 3.0).
product(macbook, apple, laptop, 1000, 5.0).
 
product(msi_pro, msi, monitor, 159.99, 2.0).
product(dell_27, dell, monitor, 199.99, 1.2).
product(dell_V2, dell, monitor, 299.99, 1.7).
product(ultrafine_4k, lg, monitor, 879.95, 3.9).
product(ultrafine_8k, lg, monitor, 999.99, 4.5).
 
product(surface_go_pro, microsoft, tablet, 999.98, 4.1).
product(surface_go, microsoft, tablet, 499.99, 4.1).
product(ipad, apple, tablet, 999.99, 3.1).
product(tab_p11, lenovo, tablet, 241.99, 2.5).
product(tab_p12, lenovo, tablet, 241.99, 2.0).
product(galaxy_tab_10, samsung, tablet, 1000.00, 3.5).
 
product(galaxy_s10, samsung, phone, 241.99, 4.5).
product(iphone_13, apple, phone, 241.99, 3.8).
product(galaxy_a23, samsung, phone, 241.99, 2.5).
 
product(quality_long_hdmi_cord, apple, hdmi_cord, 22.99, 5.0).
product(short_hdmi_cord, samsung, hdmi_cord, 24.99, 2.5).
product(long_hdmi_cord, apple, hdmi_cord, 22.99, 3.5).
product(three_hdmi_cord, rocketfish, hdmi_cord, 30.50, 4.5).
 
 
%%%%%  ATOMIC: inStock
% Add the atomic propositions for inStock in this section
inStock(macbook, eaton_centre_computer_shack, 10).
inStock(long_hdmi_cord, eaton_centre_computer_shack, 2).
inStock(short_hdmi_cord, eaton_centre_computer_shack, 3).
inStock(three_hdmi_cord, montreal_computer_shack, 3).
 
inStock(rog_strix, montreal_computer_shack, 3).
inStock(legion, scarborough_town_centre_computer_shack, 4).
inStock(blade, square_one_computer_shack, 5).
inStock(legion, south_common_center_computer_shack, 6).
 
inStock(msi_pro, square_one_computer_shack, 7).
inStock(dell_27, underground_city_computer_shack, 9).
inStock(ultrafine_4k, south_common_center_computer_shack, 6).
inStock(ultrafine_8k, south_common_center_computer_shack, 6).
 
inStock(surface_go_pro, eaton_centre_computer_shack, 3).
inStock(surface_pro, eaton_centre_computer_shack, 4).
inStock(ipad, scarborough_town_centre_computer_shack, 2).
inStock(tab_p11, underground_city_computer_shack, 5).
inStock(galaxy_tab_10, montreal_computer_shack, 10).
inStock(galaxy_tab_10, square_one_computer_shack, 10).
 
inStock(galaxy_s10, square_one_computer_shack, 4).
inStock(iphone_13, south_common_center_computer_shack, 0).
inStock(galaxy_a23, square_one_computer_shack, 3).
 
 
%%%%% ATOMIC: location
% Add the atomic propositions for location in this section
 
location(eaton_centre_computer_shack, toronto).
location(toronto_computer_shack, toronto).
location(square_one_computer_shack, toronto).
location(scarborough_town_centre_computer_shack, toronto).
 
location(montreal_computer_shack, montreal).
location(underground_city_computer_shack, montreal).
location(cf_carrefour_laval_computer_shack, montreal).
 
location(south_common_center_computer_shack, mississauga).
location(heartland_town_centre_computer_shack, mississauga).
location(westwood_square_computer_shack, mississauga).
 
%%%%% ATOMIC: canShip
% Add the atomic propositions for canShip in this section
 
 
canShip(blade, mississauga).
canShip(msi_pro, toronto).
 
canShip(dell_27, montreal).
canShip(ultrafine_4k, montreal).
canShip(surface_pro, montreal).
canShip(ipad, montreal).
 
canShip(tab_p11, mississauga).
canShip(galaxy_s10, mississauga).
canShip(iphone_13, mississauga).
canShip(galaxy_a23, mississauga).
canShip(msi_pro, mississauga).
canShip(dell_27, mississauga).
 
canShip(surface_go, toronto).
canShip(surface_go_pro, toronto).
canShip(tab_p12, toronto).
 
%%%%% LEXICON
% Add the lexicon to this section
 
article(a).
article(an).
article(any).
article(the).
 
common_noun(laptop, X) :- product(X,_,laptop,_,_).
common_noun(monitor, X) :- product(X,_,monitor,_,_).
common_noun(tablet, X) :- product(X,_,tablet,_,_).
common_noun(phone, X) :- product(X,_,phone,_,_).
common_noun(hdmi_cord, X) :- product(X,_,hdmi_cord,_,_).
common_noun(stock, X) :- product(X, _, _, _, _), inStock(X, _, C), C > 0.
common_noun(city, X) :- location(_, X).
common_noun(rating, X) :- product(X,_,_,_,Y).
common_noun(store, X) :- location(X,_).
 
preposition(in, X, Z) :- product(X,_,_,_,_), inStock(X, _, Z), Z > 0.
preposition(in, X, Y) :- location(X,Y).
preposition(at, X, Y) :- product(X,_,_,_,_), inStock(X, Y, _).
preposition(of, X, Y) :- inStock(X, _, Y). % stock of. x product, y rating.
preposition(with, X, Y) :- inStock(Y, X, _).
preposition(that_can_ship_to, X, Y) :- canShip(X, Y).
 
proper_noun(X) :- location(_, X). % city
proper_noun(X) :- location(X, _). % store
proper_noun(X) :- product(X, _, _, _, _). % product name
proper_noun(X) :- product(_, X, _, _, _). % Manufacturer
proper_noun(X) :- product(_, _, _, X, _). % price
proper_noun(X) :- product(_, _, _, _, X). % rating
proper_noun(X) :- inStock(_, _, X). % count
 
adjective(highly_rated, X) :- product(X, _, _, _, Y), Y >= 4.0.
adjective(medium_rated, X) :- product(X, _, _, _, Y), Y < 4.0, Y >= 2.5.
adjective(lowly_rated, X) :- product(X, _, _, _, Y), Y < 2.5.
adjective(expensive, N) :- product(N,_, T, P1,_), (product(N1,_, T, Cheapest,_), not (product(N2,_, T, P,_), not N1 = N2, P < Cheapest)), P2 is 2*Cheapest, P1 >= P2.
adjective(cheapest, N) :-  product(N,_, T, Cheapest,_), not (product(N2,_, T, P,_), not N = N2, P < Cheapest).
adjective(rated, X) :- product(_, X, _, _, Y).
 
adjective(apple, Y) :- product(Y, apple, _, _, _).
adjective(rocketfish, Y) :- product(_, rocketfish, _, _, _).
adjective(dell, Y) :- product(_, dell, _, _, _).
 
 
%%%%% EXTRA LANGUAGE FEATURES
% Put the extra language features for question 4 in this section
 
 
%%%%% PARSER
what(Words, Ref) :- np(Words, Ref).
 
/* Noun phrase can be a proper name or can start with an article */
 
np([Name],Name) :- proper_noun(Name).
np([Art|Rest], What) :- article(Art), np2(Rest, What).
 
 
/* If a noun phrase starts with an article, then it must be followed
   by another noun phrase that starts either with an adjective
   or with a common noun. */
 
np2([Adj|Rest],What) :- adjective(Adj,What), np2(Rest, What).
np2([Noun|Rest], What) :- common_noun(Noun, What), mods(Rest,What).
 
 
/* Modifier(s) provide an additional specific info about nouns.
   Modifier can be a prepositional phrase followed by none, one or more
   additional modifiers.  */
 
mods([], _).
mods([in, the, stock | Rest], What) :- mods(Rest, What).
mods([in, stock | Rest], What) :- mods(Rest, What).
mods(Words, What) :-
    not Words = [in, the, stock | _], not Words = [in, stock | _],
    appendLists(Start, End, Words),
    prepPhrase(Start, What),    mods(End, What).
 
prepPhrase([Prep|Rest], What) :-
   preposition(Prep, What, Ref), np(Rest, Ref).
 
prepPhrase([Prep|Rest], What) :-
   preposition(Prep, What, Ref), np(Rest, Ref).
 
 
appendLists([], L, L).
appendLists([H|L1], L2, [H|L3]) :-  appendLists(L1, L2, L3).
 
%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
 

