ve_peliculas(roberto,suspenso).
ve_peliculas(jaanai,suspenso).
ve_peliculas(abimael,suspenso).
ve_peliculas(leonardo,romance).
ve_peliculas(miguel,terror).

consume(roberto,palomitas).
consume(jaanai,palomitas).
consume(abimael,maruchan).
consume(leonardo,maruchan).
consume(miguel,ensalada).

tiene_audifonos(roberto,no).
tiene_audifonos(jaanai,si).
tiene_audifonos(abimael,no).
tiene_audifonos(leonardo,no).
tiene_audifonos(miguel,no).
tiene_audifonos(abelino,no).
tiene_audifonos(jose,no).
tiene_audifonos(izmucaneth,si).
tiene_audifonos(rolando,si).
tiene_audifonos(maldonado,no).

escucha_musica(abelino,reggae).
escucha_musica(jose,rock).
escucha_musica(izmucaneth,reggae).
escucha_musica(rolando,rock).
escucha_musica(maldonado,regional).

tiene_netflix(roberto,si).
tiene_netflix(jaanai,si).
tiene_netflix(abimael,si).
tiene_netflix(leonardo,no).
tiene_netflix(miguel,si).

tiene_spotify(abelino,no).
tiene_spotify(jose,si).
tiene_spotify(izmucaneth,si).
tiene_spotify(rolando,no).
tiene_spotify(maldonado,si).

tiempo_libre(roberto,no).
tiempo_libre(jaanai,no).
tiempo_libre(abimael,no).
tiempo_libre(leonardo,no).
tiempo_libre(miguel,no).

vida_saludable(X) :- consume(X,ensalada).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1.¿Quiénes prefieren ver películas?
%
%Solo es necesario poner ve_peliculas(X,_). pero al ejecutar las demas consultas nos genera un valor
%extra, es por eso que lo cambie a esta regla.
%La regla se cumplira si existe X que ve peliculas, sin importar cual sea, osea, el segundo termino.
%Esta proposicion tiene como terminos la variable X y _ indicando que no nos importa ese termino, solo
%quien ve peliculas.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
prefiere_ver_peliculas(X) :- ve_peliculas(X,_).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2.¿Quiénes prefieren escuchar música?
%
%Solo es necesario poner escucha_musica(X,_). pero al ejecutar las demas consultas nos genera un valor
%extra, es por eso que lo cambie a esta regla.
%Esta regla solo tiene un termino, la variable X.
%Esta proposicion tiene como terminos la variable X y _ indicando que no nos importa ese termino, solo
%quien escucha musica.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
prefiere_escuchar_musica(X) :- escucha_musica(X,_).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3.Alguien que ve peliculas de suspenso, disfruta verlas con palomitras, tiene netflix y tiempo libre,
%tiene una tarde perfecta.
%
%Esta regla solo tiene como termino la variable X, el cual indica el sujeto, para que se cumpla esta
%regla, proposicion ve_peliculas tendra como terminos la X y suspenso, consume tendra los terminos X y
%palomitas, tiene_netflix tendra los terminos X y si, tiempo libre tendra los terminos X y si.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tarde_perfecta(X) :- ve_peliculas(X,suspenso), consume(X,palomitas), tiene_netflix(X,si), tiempo_libre(X,si).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4.Alguien que ve películas consumiendo una ensalada, tiene una vida saludable.
%
%La regla tiene_vida_saludable tiene como termino la variable X, el cual indica el sujeto que cumple 
%esta. Entre sus condiciones esta, ve_pelicula tendra como terminos X y _ indicando que no nos importa
%el segundo termino, consume tendra como terminos X y ensalada.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tiene_vida_saludable(X) :- ve_peliculas(X,_),consume(X,ensalada).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%5.Alguien que escucha regional, tiene audífonos y la aplicación de spotify, disfruta del camino a casa.
%
%La regla disfruta_camino tiene como termino la variable X, el cual indica el sujeto que cumple esta. 
%Entre sus condiciones esta que escucha_musica tendra como terminos X y regional, tiene_audifonos tendra
%como terminos X y si, tiene_spotify tendra como terminos X y si.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disfruta_camino(X) :- escucha_musica(X,regional), tiene_audifonos(X,si), tiene_spotify(X,si).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%6. Alguien es feliz si ve peliculas consumiendo maruchan, tiempo libre y netflix.
%
%La regla es_feliz tiene como termino la variable X, el cual indica el sujeto que cumple esta.
%Entre sus condiciones esta que ve_peliculas tendra como terminos X y _ indicando que no nos importa la
%pelicula, consume tendra como terminos X y maruchan, tiempo_libre tendra como terminos X y si,
%tiene_netflix tendra como terminos X y si.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
es_feliz(X) :- ve_peliculas(X,_), consume(X,maruchan), tiempo_libre(X,si), tiene_netflix(X,si).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%7.Solo pueden ser amigos quienes tienen los mismos gustos (películas,botana).
%
%La regla pueden_ser_amigos tiene como termino la variable X, el cual indica el primer sujeto que cumple
%esta regla y la variable Y, siendo el segundo sujeto que cumple esta regla.
%Entre sus condiciones esta que ve_peliculas, para el primer sujeto, tendra como terminos X y en el 
%segundo termino, van a estar las peliculas que existen (suspenso, terror y romance), la siguiente
%condición sera ve_peliculas, para el segundo sujeto, tendra como terminos Y y en el segundo termino,
%van a estar las peliculas que existen (suspenso, terror y romance), sera lo mismo para consume, en este
%caso el segundo termino podra variar entre palomitas, maruchan y ensalada. Como tiene que coincidir en-
%tre los gustos, entonces ambos en el segundo termino tanto de ve_peliculas y consume tendran que tener
%lo mismo.
%Como tenermos que hacer la disyuncion entre estas condiciones para poder recorrer todas las
%posibilidades de que tengan los mismo gustos, usamos el simbolo ; el cual nos servira como el conector
%OR.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pueden_ser_amigos(X,Y) :- 
ve_peliculas(X,suspenso), ve_peliculas(Y,suspenso), consume(X,palomitas), consume(Y,palomitas);
ve_peliculas(X,suspenso), ve_peliculas(Y,suspenso), consume(X,maruchan), consume(Y,maruchan);
ve_peliculas(X,suspenso), ve_peliculas(Y,suspenso), consume(X,ensalada), consume(Y,ensalada);

ve_peliculas(X,terror), ve_peliculas(Y,terror), consume(X,palomitas), consume(Y,palomitas);
ve_peliculas(X,terror), ve_peliculas(Y,terror), consume(X,maruchan), consume(Y,maruchan); 
ve_peliculas(X,terror), ve_peliculas(Y,terror), consume(X,ensalada), consume(Y,ensalada); 

ve_peliculas(X,romance), ve_peliculas(Y,romance), consume(x,palomitas), consume(Y,palomitas);
ve_peliculas(X,romance), ve_peliculas(Y,romance), consume(x,maruchan), consume(Y,maruchan);
ve_peliculas(X,romance), ve_peliculas(Y,romance), consume(x,ensalada), consume(Y,ensalada).