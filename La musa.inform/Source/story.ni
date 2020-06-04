"La musa" by Xavier Carrascosa (in spanish)

[
Remake de la aventura La musa programada en 2005: Inspiración, pecado y romanticismo.
Escrita por Xavier Carrascosa en mayo de 2020. Ilustración de portada por Mónica Clavijo (Instagram: @clavijodibujos).
Programado con Inform 7 de Graham Nelson, versión 7.9.3 (build 6M62) - Descarga: http://inform7.com/downloads/
Traducción al español por Sarganar & otros - Descarga: https://github.com/sarganar/I7-2014-Spanish/releases
Contacto: www.xaviercarrascosa.com - Twitter/Instagram: @XCarrascosa 
]

[Datos bibliográficos]

The story title is "La musa".
The story author is "Xavier Carrascosa".
The story headline is "Inspiración, pecado y romanticismo".
The story genre is "Romance".
The release number is 2.
The story creation year is 2020.
The story description is "El pecado acecha a la puerta; y aunque viene por ti, tú puedes dominarlo. Confusa, que sólo tú eres mi musa. ¿Serás capaz de obtener suficiente inspiración de tu musa como para resultar vencedor de la aventura?".


Part 1 - Iniciando extensiones y reglas varias

Section 1.1 - Extensiones

[Efectos de pantalla básicos]
Include Basic Screen Effects Sp by Emily Short. 

[Extensión de Ayuda básica]
Include Basic Help Menu SP by Emily Short. 

[Extensión de conversaciones por menús]
Include Quip-Based Conversation Sp by Michael Martin. 


Section 1.2 - Reglas varias

[Centramos el nombre de la localidad en el centro de la barra de estado]
Rule for constructing the status line: 
	center "[location]" at row 1; 
	rule succeeds. 

[No nos interesa que el jugador haga UNDO o DESHACER en el juego,
para que no escriba más que una sola vez en cada turno. Así que:]
Use undo prevention.

[Cada acto superado otorga un punto.]
Use scoring. The maximum score is 7.

[Nueva regla para notificar los puntos ganados de manera elegante]
The announce the score rule response (D) is "[italic type]Has ganado [number understood in words] punto de destino.[roman type]" 

[Nueva regla para que el comando PUNTOS sea más elegante]
Carry out requesting the score:
	say "[if the score > 1][italic type]Has ganado [score in words] puntos de destino.[roman type][else if the score is 0][italic type]Todavía no has ganado ningún punto de destino.[roman type][else if the score is 1][italic type]Has ganado [score in words] punto de destino.[end if][paragraph break]" instead. 


Section 1.3 - Iniciando el juego

When play begins: 
choose row 1 in Table of Basic Help Options; [Menú de ayuda - Introducción al juego]
	 now description entry is "[line break]Bienvenido a [bold type]La musa[roman type], una ficción interactiva escrita por Xavier Carrascosa en 2020 a partir de la original de 2005 presentada en la XComp 1. Se trata de una aventura conversacional experimental en siete actos que puede resolverse con una sola orden. ¿Serás capaz de obtener suficiente inspiración de tu musa como para resultar vencedor de la aventura?[paragraph break][italic type]'El pecado acecha a la puerta; y aunque viene por ti, tú puedes dominarlo. Confusa, que sólo tú eres mi musa.'[roman type][paragraph break][bold type]Premios recibidos:[roman type][paragraph break][bold type]XComp 1:[roman type][line break][italic type]Premio a la Mejor Aventura[roman type][line break][bold type]Premios Hispanos 2005:[roman type][line break][italic type]Nominada en las categorías de calidad literaria, interactividad y originalidad.[roman type]";
	say "[italic type]Maldita seas musa escurridiza,[line break]me entregas tus caricias y tu beso[line break]y junto las palabras cual poseso,[line break]hundiéndome en tu arena movediza.[paragraph break]Te marchas convirtiéndome en ceniza[line break]y siento sobre el cuello un lazo grueso[line break]que asfixia deseando tu regreso,[line break]creciendo esta obsesión casi enfermiza.[paragraph break]Maldita por mostrarme las estrellas,[line break]las risas, el azul, el universo,[line break]la luz, el llanto y tantas cosas bellas.[paragraph break]Te marchas y me muestras el adverso[line break]dejándome en mi pecho mil querellas,[line break]incapaz de escribir un solo verso.[roman type][paragraph break][bold type]Roberto Menéndez[roman type][paragraph break][fixed letter spacing]Pulsa una tecla para continuar...[variable letter spacing][paragraph break]";
	wait for any key; 
	clear the screen;
	say "[line break]Bienvenido a [bold type]'La musa'[roman type], ficción interactiva experimental por Xavier Carrascosa. Esta versión es un remake en 2020 de la original presentada en 2005 para la XComp 1.[paragraph break]"; 
	say "Esta obra contiene pasajes que pueden herir la sensibilidad de algunos jugadores. No está indicada para menores de 18 años.[paragraph break]";
	say "Si es la primera vez que juegas teclea [bold type]'AYUDA'[roman type] durante la partida.[paragraph break][fixed letter spacing]Pulsa una tecla para empezar...[variable letter spacing][paragraph break]"; 
	wait for any key;
	clear the screen.

	

Section 1.4 - Ampliación de verbos y vocabulario

[Hablar con PNJs]

Before going: terminate the conversation.

[Escribir una palabra en el libro]

Understand "escribe [text] en [something]" as writing it in.
Understand "escribi [text] en [something]" as writing it in.
Understand "escribe [text]" as writing it in.
Understand "escribi [text]" as writing it in.
Understand "escribe sobre [text]" as writing it in.
Understand "escribir sobre [text]" as writing it in.
Writing it in is an action applying to a topic and one thing.
Rule for supplying a missing second noun while writing:
	if the libro is in location and the player carries the pluma, now the second noun is the libro;
	otherwise:
		if the pluma is not carried by the player:
			now the second noun is the player;
			say "'[italic type]Coge tu pluma y escribe algo en el libro que te ofrezco'[roman type], dice la musa.[paragraph break]";
		else if the libro is not in the location:
			now the second noun is the player;
			say "Debo escribir en el libro que me ofrece la musa. Aquí no es el lugar.".

Check writing it in:
	if the player carries the pluma and the location is En la oscuridad and the musa is espectante:
		say "Escribes un verso sobre [italic type]'[the topic understood]'...[roman type][paragraph break]";
		continue the action;
	else if the musa is complacida:
		say "[italic type]'Ya no hace falta que escribas nada más[roman type], dice la musa.'[paragraph break]".


[Escribir nada]

Writenothing is an action applying to nothing.
Understand "escribe", "escribi" as Writenothing.
Check Writenothing: 
	if the player carries the pluma and the location is En la oscuridad and the musa is espectante:
		say "[fixed letter spacing]Para escribir en el libro pon 'escribe TEXTO' o bien 'escribe TEXTO en libro'[variable letter spacing][paragraph break]";
	else if the musa is complacida:
		say "[italic type]'Ya no hace falta que escribas nada más[roman type], dice la musa.'[paragraph break]";
	else if the location is not En la oscuridad:
		say "Debo escribir en el libro que me ofrece la musa. Aquí no es el lugar.";
	otherwise:
		say "'[italic type]Coge tu pluma y escribe algo en el libro que te ofrezco'[roman type], dice la musa.[paragraph break]".

[Rezar]
Rezaring is an action applying to nothing. Understand "reza", "ora", "suplica" as rezaring.
Check rezaring: 
	say "Es un dios misericordioso, y tan solo tenías que pedir misericordia.[paragraph break]";
	wait for any key;
	clear the screen;
	say "[paragraph break]Recuerdas tu primer pecado... y luego todos los demás.[paragraph break]Comienzas a recordarlo todo...[paragraph break]";
	wait for any key;
	say "Recuerdas quién eres y la oscuridad se resquebraja. [paragraph break]Empieza a girar todo a tu alrededor... y recuerdas las palabras... [paragraph break]";
	wait for any key;
	say "[italic type]'Mi culpa es demasiado grande para soportarla. Hoy me destierras de aquí; tendré que ocultarme de ti, andando errante y perdido por el mundo; el que tropiece conmigo me matará.'[roman type][paragraph break]";
	wait for any key;
	say "El Señor te dijo: [italic type]'El que mate a Caín lo pagará siete veces.'[roman type][paragraph break]Y el Señor puso una señal a Caín para que, si alguien tropezase con él, no le matara.[paragraph break]";
	say "De nuevo la mima voz, ahora, retruena en tu cabeza: [italic type]'Ahora ya has pedido perdón, puedes descansar en paz, después de tantos años, después de tantos pecados. Tu castigo llega a su fin, camina por fin libre, hijo mio.'[roman type][paragraph break]";
	wait for any key;
	say "Tu espíritu que alguna vez fue celestial se escapa de entre los muros del castigo, dejando atrás a la bella y perversa Lilith, tu musa, cuyas lágrimas por tu ausencia te salpican en el rostro, a medida que te desvaneces en el éter para no volver a verla jamás.[paragraph break]";
	wait for any key;
	end the story finally.

[Recordar]
Remembering is an action applying to nothing.
Understand "recuerda", "recorda" as remembering. 
Report remembering: say "Tratas de recordar, pero ha pasado ya tanto tiempo...[paragraph break][italic type]'No te preocupes por el pasado, ahora estamos aquí en el presente'[roman type], dice la musa.".

[Pensar]
Instead of thinking, say "¿Como puedo escapar de esta espiral de odio y destrucción?[paragraph break][italic type]'¿En qué piensas?'[roman type], pregunta la musa.[paragraph break]".


[Fornicar]
Fucking is an action applying to one thing.
Understand "fornica [someone]", "folla [someone]", "ama [someone]", "penetra [someone]", "penetra a [someone]", "fornica con [someone]", "folla con [someone]", "ama a [someone]", "haz el amor con [someone]", "hazle el amor a [someone]", "hacer el amor con [someone]", "hacer el amor a [someone]", "monta [someone]", "cubre [someone]", "masturba [someone]", "monta a [someone]", "cubre a [someone]", "masturba a [someone]", "masturbate con [someone]" as fucking.
Report fucking: say "[italic type]'¿También tienes pensamientos pecaminosos con [the noun]?'[roman type], dice la musa.".

Faping is an action applying to one thing.
Understand "fornica [something]", "folla [something]", "ama [something]", "penetra [something]", "fornica con [something]", "folla con [something]", "ama a [something]", "haz el amor con [something]", "hazle el amor a [something]", "hacer el amor con [something]", "hacer el amor a [something]", "monta [something]", "cubre [something]", "masturba [something]", "monta a [something]", "cubre a [something]", "masturba a [something]", "masturbate con [something]" as faping.
Report faping: say "[italic type]'Interesante... ¿estás pensando en masturbarte con [the noun]?'[roman type], pregunta la musa.".


[Cantar]
Singing is an action applying to nothing. Understand "canta", "recita", "canto", "llora", "grita" as singing. 

Report singing: say "Entonas una amarga melodia en una arcana lengua hace tiempo olvidada.".


[Leer]
Understand "lee [something]" as examining. 



Part 2 - En la oscuridad

En la oscuridad is a room. The description is "Sentado en algún punto de apoyo invisible en una oscuridad infinita, tu mirada se clava en el libro de páginas eternas que escribes con la ayuda de tu musa, acompañante fiel en tu pena y en tu pesar."

The description of the player is "No importa tu aspecto, eres lo que dicte tu inspiración en cada momento.".

A pluma (f) is here. "Sobre el libro está tu pluma.". The description of the pluma is "Solo es una pluma de la que constantemente gotea sangre.".
Understand "estilografica", "lapiz", "punta" as the pluma.


Chapter 1 - La musa

The musa (f) is here. The musa is a woman. "[if espectante]La musa espera que escribas en el libro del destino.[otherwise]No puedes dejar de mirar a tu musa."
The musa can be complacida or espectante. The musa is espectante.
The description of the musa is "Tan bella como oscura, irradia una rojiza luz maléfica que envuelve tu ser y tu libro, impregnando las páginas con sangre.". Understand "luz", "mujer", "lilith" as the musa.
Some ojos (m) are part of the musa. 
Understand "mirada", "ojo", "sangre", "ceniza", "cenizas", "oscuridad", "punto", "apoyo" as the ojos.


Section 1 - Examinar la musa

[Examinar la musa para iniciar los actos]
After examining the musa:
	if the musa is espectante: 
		say "La musa espera que escribas en el libro del destino.[paragraph break]";
	else if the musa is complacida:
		say "Su visión te produce una extraña reacción que ahora conoces muy bien... comienza tu inspiración.";
		now the pluma is in location;
		if pecados is 0:
			if Primer acto is unvisited, increase the score by 1;		
			wait for any key;
			clear the screen;
			now the player is in Primer acto;
		else if pecados is 1:
			if Segundo acto is unvisited, increase the score by 1;
			wait for any key;
			clear the screen;
			now the player is in Segundo acto;	
		else if pecados is 2:
			if Tercer acto is unvisited, increase the score by 1;
			wait for any key;
			clear the screen;
			now the player is in Tercer acto;
		else if pecados is 3:
			wait for any key;
			clear the screen;
			now the player is in Cuarto acto;
			if Cuarto acto is unvisited, increase the score by 1;
		else if pecados is 4:
			if Quinto acto is unvisited, increase the score by 1;
			wait for any key;
			clear the screen;
			now the player is in Quinto acto;
		else if pecados is 5:
			if Sexto acto is unvisited, increase the score by 1;
			wait for any key;
			clear the screen;
			now the player is in Sexto acto;
		else if pecados is 6:
			if Septimo acto is unvisited, increase the score by 1;
			wait for any key;
			clear the screen;
			now the player carries the piedra;
			now the description of the piedra is "Es una piedra ensangrentada, con la que cometiste tu primer asesinato.";
			now the player is in Septimo acto;
	otherwise:
		say "Su visión te produce una extraña reacción que ahora conoces muy bien... ".
		

Section 2 - Atacar a la musa

Instead of attacking or pulling or pushing or waving the musa:
	if the player carries the piedra:
		try throwing the piedra at the musa;
	otherwise:
		say "[italic type]'He dicho que me mires...'[roman type], te ordena la musa.[paragraph break]No puedes dejar de mirar sus ojos...[paragraph break]";
		try examining the musa.

Instead of throwing the piedra at the musa:
	say "[italic type]'¡No es a mí a quien debes lanzar esa piedra, sino a tu hermano!'[roman type], te indica la musa.[paragraph break]Y así, de una forma aún más dolorosa... comienza tu inspiración.[paragraph break]";
	now the musa is complacida;
	wait for any key;
	try examining the musa.

Instead of attacking the ojos, try attacking the musa.


Section 3 - Hablar con la musa

Instead of talking to the musa, say "Ella te habla solo cuando lo desea. Sabes que lo que está esperando es que [if espectante]escribas en el libro[end if][if complacida]la mires[end if] y te inspires con su malévola belleza.[paragraph break][if espectante][italic type]'No hace falta que hables, tan solo escribe...'[roman type], dice la musa.[paragraph break][otherwise][italic type]'No hace falta que hables, tan solo mírame...'[roman type], dice la musa.[paragraph break]".


Section 4 - Otras acciones con la musa

Instead of smelling or tasting the musa, say "Huele a cenizas, dolor y desesperación.".

Instead of examining or closing or opening or pulling or waving or pushing the ojos:
	say "[italic type]'He dicho que me mires...'[roman type], te ordena la musa.[paragraph break]No puedes dejar de mirar sus ojos...[paragraph break]";
	wait for any key;
	try examining the musa.
	
Instead of closing or opening or pulling or waving or pushing the musa:
	say "[italic type]'He dicho que me mires...'[roman type], te ordena la musa.[paragraph break]No puedes dejar de mirar sus ojos...[paragraph break]";
	wait for any key;
	try examining the musa.

Instead of fucking or kissing or touching the musa:
	say "[italic type]'Como desees...'[roman type], dice la musa.[paragraph break]El tiempo que pasas con ella en el abismo no siempre es doloroso.[paragraph break]";
	wait for any key;
	say "[italic type]'Y ahora, [if the musa is espectante]escribe en el libro del destino[else if the musa is complacida]mírame de nuevo[end if]'[roman type], dice la musa. [paragraph break]Pero a veces la inspiración no siempre es placentera.[paragraph break]".
	
Instead of fucking or kissing or touching the ojos, try fucking the musa.

Chapter 2 - El libro del destino

[El libro de páginas eternas]
A libro (m) is here. The description of the libro is "Es un libro cuyas páginas están salpicadas de rencores, pecados, desamores, guerras y temores, reunidos en forma de poemas de ininteligible lectura.". The libro is scenery.
Understand "pagina", "poemas", "poema", "versos", "verso", "paginas", "salpicaduras" as the libro.


Section 1 - El contador de pecados

[Declaramos la variable numérica 'pecados'. Si no se especifican las variables empiezan con valor 0.]

The pecados is a number that varies. 


Section 2 - Escribir en el libro
	
Carry out writing it in:
	if the pluma is not carried: 
		stop the action;
	else if the musa is espectante:
		now the musa is complacida;
		if the topic understood matches "palabras/tonterias/poema/relato/cuento/versos/amado/follar":
			say "A tu musa también le place que escribas vaguedades, pues alivia en parte tu maldición y tu pesar.[paragraph break]";
			rule succeeds;
		if the topic understood matches "ayuda/auxilio/socorro":
			say "La musa acaricia tu rostro. [italic type]'No necesitas ayuda, tan solo mírame...'[roman type][paragraph break]";
			rule succeeds;
		if the topic understood matches "en libro":
			say "[fixed letter spacing]Para escribir en el libro pon 'ESCRIBE [italic type]texto[roman type]', 'ESCRIBE [italic type]texto[roman type] EN LIBRO' o bien 'ESCRIBE EN LIBRO [italic type]texto[roman type]'.[paragraph break]Teclea 'AYUDA' para más instrucciones.[variable letter spacing][paragraph break]";
			now the musa is espectante;
			rule succeeds;
		if the topic understood matches "libro/texto/verso/algo":
			say "[fixed letter spacing]Para escribir en el libro pon 'ESCRIBE [italic type]texto[roman type]', 'ESCRIBE [italic type]texto[roman type] EN LIBRO' o bien 'ESCRIBE EN LIBRO [italic type]texto[roman type]'.[paragraph break]Teclea 'AYUDA' para más instrucciones.[variable letter spacing][paragraph break]";
			now the musa is espectante;
			rule succeeds;
		if the topic understood matches "muerte/sacrificio/honor/soldado/guerra/mercader/castigo":
			say "[italic type]'Escribir sobre el arte de dar muerte siempre se te ha dado bien'[roman type], tu musa sonrie satisfecha.[paragraph break]";
			rule succeeds;
		if the topic understood matches "insulto/palabrota/palabrotas/puta/zorra/cerda/guarra":
			say "[italic type]'¡Guarda tu ira para el momento propicio! Te iría mejor si me respetaras al menos a mí'[roman type], te advierte la musa.[paragraph break]";
			rule succeeds;
		if the topic understood matches "vida/ternura/amor/desamor/belleza/abismo/penitencia":
			say "Tu musa se estremece al ver lo que escribes, pero pronto sonrie de nuevo, aunque algo inquieta...[paragraph break]";
			rule succeeds;
		if the topic understood matches "hermano/abel/eva/adan/dios":
			say "[italic type]'Nunca me han gustado tus versos sobre [the topic understood]'[roman type], dice alterada la musa.[paragraph break]";
			rule succeeds;
		if the topic understood matches "sucesos/actos/ovejas/castillo/comida":
			say "La musa sonrie al verte escribir tan bellamente sobre tus recuerdos...[paragraph break]";
			rule succeeds;
		if the topic understood matches "musa/lilith":
			say "La musa sonrie al ver que tus versos hablan sobre ella. Te abraza con su oscuridad y te envuelven las cenizas...[paragraph break][italic type]'Gracias por tus versos, amado mío'[roman type], dice tu musa.[paragraph break]";
			rule succeeds;
		if the topic understood matches "espada/doncella/violacion/banquete/diamante":
			say "[italic type]'No te has de sentir culpable'[roman type], susurra la musa.[paragraph break]";
			rule succeeds;
		if the topic understood matches "ternero/asesinato/venganza/piedra/canticos/sangre/visceras":
			say "La musa se regociza ante los recuerdos de tu ofrenda...[paragraph break]";
			rule succeeds;
		if the topic understood matches "pecado/avaricia/envidia/gula/mentir/pecar/matar":
			say "Tu musa da un paso atrás, porque comprende que ahora sabes que estás cumpliendo una penitencia y que ella en realidad es tu carcelera. Pero sonrie igualmente, pues estás a su lado y aún así la amas.[paragraph break]";
			rule succeeds;
		if the topic understood matches "ira/lujuria/pereza/soberbia/pecados/violar/asesinar":
			say "Tu musa da un paso atrás, porque comprende que ahora sabes que estás cumpliendo una penitencia y que ella en realidad es tu carcelera. Pero sonrie igualmente, pues estás a su lado y aún así la amas.[paragraph break]";
			rule succeeds;
		if the topic understood matches "cain":
			say "La musa palidece al ver tu nombre sobre la página... pues Caín es como te llamas.[paragraph break]";
			rule succeeds;
		otherwise:
			say "Otro verso ininteligible...".


Section 3 - Otras acciones con el libro

Instead of pulling or pushing or attacking the libro, say "No acabarás con tu agonía de esta manera, pues el libro es indestructible y bien lo sabes, al igual que lo sabe tu musa.".

Instead of smelling or tasting the libro, say "Su olor es una mezcla se sangre y cenizas...".

Instead of touching the libro, say "Rugosas páginas, carcomidas por el paso de los tiempos.".


Part 3 - Siete actos

[Definimos la región donde tienen lugar los actos]

The abismo is a region. Primer acto, Segundo acto, Tercer acto, Cuarto acto, Quinto acto, Sexto acto and Septimo acto are in the abismo. [Una 'region' es un conjunto de localidades que nos interesa tener agrupadas como región 'abismo'.]

The presencia is a backdrop in the abismo. "No puedes verla, pero sientes la presencia acechante de tu musa.". Understand "musa" as the presencia. [Un backdrop es un decorado que vamos a incluir en cada localidad de 'abismo']

Chapter 1 - Primer acto
	
Primer acto is a room. The description is "[if unvisited]Tu mente nublada se recupera del estallido de sensaciones contradictorias que te ha producido la sola visión de tu musa.[paragraph break][end if]Apareces de entre la bruma en un campo verde y puro. Estás cansado y te tumbas en la fresca hierba contemplando un imposible atardecer. El paisaje bucólico se ve aderezado por la aparición de un rebaño de ovejas."

Section 1 - Acciones varias

Instead of listening when the player is in Primer acto, say "Todo parece muy apacible, no hay ningún ruido.".

Instead of smelling when the player is in Primer acto, say "El suave aroma del pasto invita a relajarse y descansar.".

Instead of touching or pushing or pulling or waving the paisaje, try examining the paisaje.

The paisaje (m) is here. The description of the paisaje is "Estás demasiado cansado para eso, te apetece dormir...".
Understand "paisaje", "campo", "arbol", "hierba", "atardecer" as the paisaje. The paisaje is scenery.

Some ovejas (f) are here. The description of the ovejas is "Las ovejas campan a sus anchas, el rebaño se ha escapado del control del pastor, que te parece ver a lo lejos, intentando reunir de nuevo a sus animales.". Understand "oveja", "animal", "animales", "rebano" as the ovejas. They are scenery.

Instead of touching or pushing or pulling or waving the ovejas, try taking the ovejas.

Instead of taking the ovejas, say "Quizá podrías ayudar al pastor a reunir su rebaño pero... la musa quiere que descanses. 
[paragraph break][italic type]'Duérmete mi niño,[roman type] dice la musa. [italic type]Estás muy cansado.'[roman type][paragraph break]".


Section 2 - Descansar

Before sleeping:
	if the player is in Primer acto:
		say "Plácidamente te recuestas y cierras los ojos, sumiéndote de nuevo en la imperante oscuridad que te envuelve siempre que tu musa está contigo.[paragraph break]";
		wait for any key;
		say "En tus manos está la pluma y delante otra página en blanco del libro.[paragraph break]";
		now the player carries the pluma;
		now the musa is espectante;
		increase the pecados by 1; [aumentamos el contador de pecados para que cambien los actos]
		wait for any key;
		clear the screen;
		now the player is in En la oscuridad;
		stop the action;
	else if the player is in Septimo acto:
		say "[italic type]'No, ahora no es momento de dormir...'[roman type], dice la musa.[paragraph break]" instead;
	otherwise:
		if the player is in En la oscuridad:
			say "[italic type]'Duerme, descansa bien, no tenemos ninguna prisa aquí'[roman type], dice la musa.[paragraph break]" instead.
		

Section 3 - El pastor
	
The pastor (m) is here. The pastor is a man and scenery. The litany of the pastor is the Table of Pastor Conversation. The description of the pastor is "No lo puedes ver muy bien, además estás demasiado cansado para acercarte a mirar.".
Understand "hombre" as the pastor.

Instead of taking or pulling or pushing or attacking or waving or kissing or touching or smelling the pastor, say "[italic type]'Para qué quieres hacerlo, ¿acaso no estás cansado?''[roman type], pregunta la musa.[paragraph break]";


Table of Quip Texts (continued)
quip	quiptext 
escucha-pastor	"[italic type]'Déjalo, déjalo estar'[roman type], dice la musa."
ayuda-pastor	"[italic type]'No... déjalo, ya perdió su rebaño, ahora descansa'[roman type], dice la musa."
hola-pastor	"El pastor parece que no puede oírte."

Table of Pastor Conversation
prompt	response	enabled 
"¿Puede oírme?"	escucha-pastor	0 
"¿Necesita ayuda?"	ayuda-pastor	0 
"¡Hola!"	hola-pastor	1 


After quipping when the current quip is hola-pastor: 
	enable the escucha-pastor quip;
	enable the ayuda-pastor quip.
	
After quipping when the current quip is ayuda-pastor: 
	enable the ayuda-pastor quip;
	terminate the conversation.

Chapter 2 - Segundo acto

Segundo acto is a room. The description is "[if unvisited]Tu mente nublada se recupera del estallido de sensaciones contradictorias que te ha producido la sola visión de tu musa.[paragraph break][end if]Estás en lo alto de un castillo, desde donde puedes ver toda la sierra. Tu arrogante figura proyecta unas sombras sobre lo que parece ser un banquete improvisado, dispuesto sobre unas bandejas en el centro del torreón. A un lado puedes ver encadenado a un pobre hombre.".

Some bandejas (f) are here. The bandejas are scenery. The description is "Bandejas repletas de comida... asado, frutas y todo tipo de delicias."

The torreon (m) is here. It is scenery. The description is "Un alto torreón desde donde se divisa toda la sierra.". 
Understand "torre" and "castillo" as the torreon. The printed name of the torreon is "torreón".

The sierra (f) is here. It is scenery. The description of the sierra is "Desde aquí puedes divisar toda la sierra. En el cielo, los cuervos dan vueltas. Uno de ellos se acerca sobrevolando el torreón. Sus graznidos hacen enloquecer al hombre encadenado.". Understand "cielo" and "paisaje" as the sierra.

The cuervo (m) is here. It is scenery. The description of the cuervo is "El cuervo espera impaciente a que el prisionero acabe con su agonía...".

Some cadenas (f) are here. They are scenery. The description of the cadenas is "El hombre está encadenado con fuertes cadenas. Dos verdugos a cada lado vigilan que no pueda moverse." Understand "cadena", "poste" as the cadenas.

Some verdugos (m) are here. They are man and scenery. The description of the verdugos is "Tus verdugos están aquí para acatar tus órdenes.". Understand "verdugo" as the verdugos.


Section 1 - Acciones varias

Instead of listening when the player is in Segundo acto, say "Escuchas los graznidos de los cuervos.".

Instead of smelling when the player is in Segundo acto, say "El banquete huele estupendamente, para desesperación del hombre ajusticiado.".

Instead of talking to or attacking or taking the verdugos, say "Déjalos, están para cumplir tus órdenes.".


Section 2 - El banquete

The banquete (m) is here. The banquete is edible. The description of the banquete is "Es un banquete compuesto de un asado especiado, frutas y demás delicias para el paladar.". The banquete is scenery.
The comida (f), some frutas (f), a asado (m) and some delicias (f) are edible and part of the banquete.

Instead of examining something edible when the player is in Segundo acto, say "Es un banquete compuesto de un asado especiado, frutas y demás delicias para el paladar.[paragraph break][italic type]'¡Cómete [the noun]!'[roman type], te dice la musa desde algún lugar invisible.[paragraph break]".

Instead of smelling or tasting or taking something edible when the player is in Segundo acto:
	say "Tiene una pinta estupenda, huele muy bien y su sabor es delicioso...[paragraph break][italic type]'¡Cómete [the noun]!'[roman type], te dice la musa desde algún lugar invisible.[paragraph break]".
	
Instead of eating something edible when the player is in Segundo acto:
	say "Te agachas para probar [the noun], más no puedes resistir a la tentación y empiezas a comer todo lo que en la bandeja hay, ante la antenta mirada de odio del ajusticiado.[paragraph break]";
	wait for any key;
	say "Todo está delicioso, y escuchas la aprobación y la sonrisa de tu musa, que te hace retornar a tu oscuridad, ante el libro del destino y la pluma sanguinolenta en tu mano.[paragraph break]";
	now the player carries the pluma;
	now the musa is espectante;
	increase the pecados by 1; [aumentamos el contador de pecados para que cambien los actos]
	wait for any key;
	clear the screen;
	now the player is in En la oscuridad.


Section 3 - El ajusticiado

The ajusticiado (m) is here. The ajusticiado is a man and scenery. The litany of the ajusticiado is the Table of Ajusticiado Conversation. The description of the ajusticiado is "Viste túnicas extranjeras rotas y roídas, tiene la mirada fiera y desafiante, a pesar de su estado esquelético y su condición de reo ajusticiado. Está encadenado a un poste y dos verdugos lo custodian.".
Understand "prisionero", "mirada", "tunica", "tunicas", "reo" and "hombre" as the ajusticiado.

[Hablar con el ajusticiado]

Table of Quip Texts (continued)
quip	quiptext 
tu-crimen	"El hombre apenas puede hablar. Uno de los verdugos se acerca y te susurra al oído. [italic type]Dicen que robó una gallina para poder alimentar a su familia...[roman type]"
azotadle	"Uno de tus verdugos acata la orden y le propina severos latigazos al ajusticiado, que se retuerce de dolor."
hambriento	"[italic type]'¡Déjame en paz, asesino!'[roman type], te grita el hombre."

Table of Ajusticiado Conversation
prompt	response	enabled 
"¿Cuál es tu crimen, hombre infeliz?"	tu-crimen	0 
"¡Azotadle!"	azotadle	0 
"Pareces hambriento..."	hambriento	1 

After quipping when the current quip is hambriento: 
	enable the azotadle quip;
	enable the tu-crimen quip.
	
After quipping when the current quip is azotadle: 
	enable the azotadle quip;
	terminate the conversation.
	
After quipping when the current quip is azotadle, enable the azotadle quip. 
	
Instead of pulling or pushing or attacking or waving or kissing or touching or smelling the ajusticiado, say "No vale la pena, ya está muerto en vida.[paragraph break]";


Chapter 3 - Tercer acto

Tercer acto is a room. The description is "[if unvisited]Tu mente nublada se recupera del estallido de sensaciones contradictorias que te ha producido la sola visión de tu musa.[paragraph break][end if]Estás en el campo de batalla, feroces guerreros te rodean armados con espadas y artilugios de dar muerte. Ante ti hay un soldado moribundo que implora salvar su mísera vida.".

Some guerreros (m) are here. They are scenery. The description of the guerreros is "Fieros guerreros que te son leales. Esperan a que termines con la vida del último de los enemigos.". Understand "hombres", "guerrero" as the guerreros.

Some armas (f) are here. They are scenery. The description of the armas is "Las armas de tus guerreros repiquetean en sus escudos. Todos esperan el inevitable desenlace.". Understand "artilugios", "espadas" as the armas.

Section 1 - Acciones varias

Instead of taking or attacking or touching or pushing or pulling or waving the guerreros, try examining the guerreros. 

Instead of taking or attacking or touching or pushing or pulling or waving the armas, try examining the armas. 

Instead of talking to the guerreros, say "[italic type]'¿Creéis que este infeliz debe morir por su vil traición?',[roman type] preguntas a tus hombres.[paragraph break][italic type]'¡Mátalo, mátalo!',[roman type] te responden.[paragraph break][italic type]'Aquí el único traidor eres tú, que has engañado a todos...',[roman type] te dice el soldado.[paragraph break]".


Section 2 - El soldado

The soldado (m) is here. The soldado is a man and scenery. The litany of the soldado is the Table of Soldado Conversation. The description of the soldado is "Es un soldado vencido en la batalla, tiene horribles heridas y le falta media mano derecha, su espada está tirada a un lado... junto al resto de su mano.".
Understand "mirada", "enemigo", "traidor", "infeliz" and "hombre" as the soldado.
Some heridas (f), a mano (f) and the espada (f) are part of the soldado. 

The description of the heridas is "Horribles heridas, pero que quizás con el debido tratamiento podrían sanar. No va a ser el caso.".

The description of the mano is "La mitad de la mano derecha del soldado está tirada en el suelo, [if the player carries the espada]en un charco de sangre.[otherwise]al lado de una ensangrentada espada.".

The description of the espada is "Una ensangrentada espada.".

Instead of taking the espada:
	now the espada is portable;
	now the player carries the espada;
	say "El hombre te suplica... [italic type]'¡No! ¡Por favor, no!'[roman type]."

Instead of taking or pulling or pushing or waving or attacking the heridas, say "Déjalas, tampoco quieres mancharte tanto de sangre.".

Instead of taking or pulling or pushing or waving or attacking the mano, say "Pisas el trozo de la mano derecha que le falta, tirado ahí en el campo de batalla en un charco de sangre. Sonríes. El hombre se echa a llorar.".


[Hablar con el soldado]

Table of Quip Texts (continued)
quip	quiptext 
espada-buena	"El hombre observa con pavor la espada.[paragraph break]Le dices:[italic type]'Hay cierta poesía en morir por la propia espada de uno, blandida por su enemigo, ¿no es así?'[roman type]"
sufrimiento	"[italic type]¡No, por favor, no me mates! Déjame marchar![roman type]"
palabras	"[italic type]'¡Piedad, por favor! ¿Qué locura es ésta? ¡Soy inocente!'[roman type], te implora el hombre."

Table of Soldado Conversation
prompt	response	enabled 
"Esta parece una buena espada..."	espada-buena	0 
"Esas heridas tienen que doler, déjame ponerle fin a tu sufrimiento..."	sufrimiento	1 
"¿Quieres decir tus últimas palabras?"	palabras	0 


After quipping when the current quip is sufrimiento: 
	enable the palabras quip;
	enable the espada-buena quip.
	
After quipping when the current quip is palabras: 
	enable the palabras quip;
	terminate the conversation.
	
After quipping when the current quip is espada-buena:
	if the espada is not carried by the player:
		now the espada is portable;
		now the player carries the espada;
		say "Te agachas a recoger la espada del suelo y la empuñas con fuerza. El hombre implora piedad.[paragraph break]";
	otherwise:
		say "Pones la punta de la espada sobre el gaznate del aterrado soldado.[paragraph break]". 
	
After quipping when the current quip is palabras, enable the palabras quip. 

Instead of attacking the soldado:
	if the player carries the espada:
		say "Empuñas firmemente la espada y le rebanas el cuello de un certero tajo.[paragraph break]";
		wait for any key;
		say "La sangre brota a borbotones y te ensucia los ropajes...[paragraph break]Tu musa sonrie satisfecha ante la consecución lógica de tu nueva inspiración.[paragraph break]";
		wait for any key;
		say "Pronto te rodea la oscuridad y de nuevo te enfrentas a una nueva página en blanco.[paragraph break]";
		now the espada is in location;
		now the player carries the pluma;
		now the musa is espectante;
		increase the pecados by 1; [aumentamos el contador de pecados para que cambien los actos]
		wait for any key;
		clear the screen;
		now the player is in En la oscuridad;
	otherwise:
		say "[italic type]'Mejor mátalo con su propia espada'[roman type], te susurra la musa.".

Instead of taking or pulling or pushing or waving or attacking the soldado, say "[italic type]'¿A qué esperas? ¡Mátalo!'[roman type], dice tu Musa. [paragraph break]El hombre implora piedad.".


Chapter 4 - Cuarto acto

Cuarto acto is a room. The description is "[if unvisited]Tu mente nublada se recupera del estallido de sensaciones contradictorias que te ha producido la sola visión de tu musa.[paragraph break][end if]Tus pasos te conducen hacia una habitación amplia, decorada con motivos femeninos, donde una hermosa doncella peina su larga cabellera, ante un espejo, sentada desnuda sobre una butaca.".

A habitacion (f) is here. The habitacion is scenery. The printed name of the habitacion is "habitación". 
The description of the habitacion is "Una lujosa habitación débilmente iluminada para la ocasión, donde puedes ver una butaca sobre la que se peina una doncella desnuda frente a un espejo.". Understand "sala", "cuarto" as the habitacion.
Some decorados (m) are part of the habitacion.

The description of the decorados (m) is "¿Qué me importa la decoración de la sala?". Understand "decoracion", "motivos", "telas", "cortinas" and "motivos femeninos" as the decorados.

A espejo (m) is here. The espejo is scenery. The description of the espejo is "Un gran espejo ovalado donde se refleja la gran belleza de esta muchacha.".

A cama (f) is here. The cama is scenery. The description of the cama is "Apenas visible en el otro extremo de la sala está la cama, donde acabaréis esta noche.".


Section 1 - Acciones varias

Instead of touching or pulling or pushing or waving or attacking the espejo, say "Golpeas el espejo y la doncella cierra los ojos.[paragraph break][italic type]'¿Qué vas a hacer?'[roman type], escuchas a la musa decir... [italic type]'¿Qué debes hacer?'[roman type][paragraph break]".

A butaca (f) is here. The butaca is scenery. The description of the butaca is "¿Qué importa la butaca? No puedes hacer otra cosa que mirar la deslumbrante desnudez de la doncella. [paragraph break]Un calor incesante se apodera de tu cuerpo, que lucha en vano por superar el instinto primario...".

Instead of touching or pulling or pushing or waving or attacking the butaca, say "Empujas la butaca y la doncella cierra los ojos.[paragraph break][italic type]'¿Qué vas a hacer?'[roman type], escuchas a la musa decir... [italic type]'¿Qué debes hacer?'[roman type][paragraph break]".


Section 2 - La doncella

The doncella (f) is here. The doncella is a woman and scenery. The litany of the doncella is the Table of Doncella Conversation. The description of the doncella is "Su bello rostro mantiene una mirada lánguida en el espejo, [if cepillo is in location]esperando lo inevitable. [otherwise]cepillándose enérgicamente el pelo para eliminar sus enredos. [end if]Su semblante es triste y parece que está llorando.".
Understand "chica", "rostro", "muchacha", "semblante" and "mujer" as the doncella.
Some enredos (m), the cabello (m), a mirada (f) and a cepillo (m) are part of the doncella. 

The description of the enredos is "El cabello de la doncella, largo y rizado, presenta algunos enredos.".

The description of the cabello is "Su cabello es ondulado y del color del oro.". Understand "pelo" as the cabello.

The description of the mirada is "Sus ojos son grandes y hermosos.".

The description of the cepillo is "Un lujoso cepillo con el que se sacude los enredos de su cabello.".

Instead of touching or pulling or pushing or waving or attacking the cepillo, try taking the cepillo.

Instead of taking the cepillo:
	now the cepillo is portable;
	now the description of the cepillo is "Es el cepillo con el que la doncella suele sacudirse el cabello.";
	now the player carries the cepillo;
	say "La muchacha ahoga un sollozo... [italic type]'No he terminado de arreglarme... mi señor'[roman type], dice la doncella."

Instead of touching or pulling or pushing or waving or attacking the cabello, try taking the enredos.
Instead of taking or touching or pulling or pushing or waving or attacking the enredos, say "Le estiras del cabello a la doncella. Ella apenas opone resistencia.[paragraph break]".


[Hablar con la doncella]

Table of Quip Texts (continued)
quip	quiptext 
deja-ya	"La chica se queda inmóvil frente al espejo."
buenas-noches	"Al articular palabra, la doncella se estremece, una lágrima cae de su rostro. No implora ayuda, ni clemencia... está indefensa ante ti."
cabello-hermoso	"[italic type]'Muchas gracias, mi señor...'[roman type], dice la doncella."

Table of Doncella Conversation
prompt	response	enabled 
"¡Deja ya de cepillarte el pelo!"	deja-ya	0 
"Buenas noches, muchacha"	buenas-noches	1 
"Tu cabello es hermoso"	cabello-hermoso	0 

After quipping when the current quip is buenas-noches: 
	enable the cabello-hermoso quip;
	enable the deja-ya quip.

After quipping when the current quip is deja-ya: 
	enable the deja-ya quip;
	terminate the conversation.

Instead of touching or smelling or tasting or kissing the doncella:
	say "[italic type]'Demasido delicado, ¡haz lo que hay que hacer!'[roman type], dice la musa.[paragraph break]".
	
Instead of pulling or pushing or waving or attacking the doncella:
	say "[italic type]'¡Eso es! ¡Ahora hazlo ya!'[roman type], dice la musa.[paragraph break]".
	
Instead of fucking the doncella:
		say "Agarras a la doncella y se desata en tí un torbellino de deseo que sólo puede culminar en la realización de aquello que anhelas....[paragraph break]";
		wait for any key;
		say "Empujas a la doncella y ésta cae al suelo, y tú sobre ella. [paragraph break]Escuchas la dulce sonrisa de tu musa, que apaga los alaridos de la doncella ante tus acometidas.[paragraph break]";
		wait for any key;
		say "Y de nuevo te envuelve la oscuridad y ante tu presencia la doncella se transforma en libro, que espera de nuevo tu escritura.[paragraph break]";
		now the cepillo is in location;
		now the player carries the pluma;
		now the musa is espectante;
		increase the pecados by 1; [aumentamos el contador de pecados para que cambien los actos]
		wait for any key;
		clear the screen;
		now the player is in En la oscuridad.


Chapter 5 - Quinto acto

Quinto acto is a room. The description is "[if unvisited]Tu mente nublada se recupera del estallido de sensaciones contradictorias que te ha producido la sola visión de tu musa.[paragraph break][end if]Puedes vislumbrar el lugar donde te parece estar, una extraña sala octogonal recubierta de pinturas obscenas. En el centro, entre almohadas y finas telas, [if mercader is vivo]descansa dormido un rico mercader[else if mercader is muerto]está el cuerpo sin vida del mercader[end if], sosteniendo entre sus manos un gran diamante tallado con la forma de una flor.".


Some pinturas (f) are here. The pinturas are scenery. The description of the pinturas is "Pinturas obscenas rodean la estancia, propias de un alma corrupta y decadente. En el centro de la sala está la cama donde reposa el mercader.".
Understand "pintura", "cuadro" and "decadencia" as the pinturas.

A cama grande (f) is here. The cama grande is scenery. The printed name of cama grande is "cama". The description of the cama grande is "Apenas se puede ver la cama con tantos cojines y almohadas como hay sobre ella.". Understand "cama" and "lecho" as the cama grande. Some almohadas (f) and some cojines (m) are part of the cama grande. 

The description of the almohadas is "[if almohada is handled]Apenas se puede ver la cama con tantos cojines y almohadas como hay sobre ella.[otherwise]El mercader reposa sobre un lecho de cojines y almohadas, una de las cuales está muy cerca de ti.". Understand "almohada" or "almoada" as the almohadas.

The description of the cojines is "[if almohada is handled]Apenas se puede ver la cama con tantos cojines y almohadas como hay sobre ella.[otherwise]El mercader reposa sobre un lecho de cojines y almohadas, una de las cuales está muy cerca de ti.". Understand "cojin" as the cojines.

Does the player mean examining or taking the almohadas in the presence of the almohada: it is very unlikely. [solucion para desambiguación]

A almohada (f) is nowhere. The description of the almohada is "Una almohada ricamente adornada.[paragraph break][italic type]'Mata al mercader... y el diamante será tuyo... ¡mátalo!'[roman type], te sisea la musa.";

A diamante (m) is here. The diamante is scenery. The description of the diamante is "El diamante más maravilloso que existe, sin duda. Es tal su belleza... es tanto su valor... [paragraph break][italic type]'Cógelo, es tuyo'[roman type], dice la musa.". Understand "joya", "valor", "brillante" and "brillo" as the diamante.


Section 1 - Acciones varias
	
Instead of listening when the player is in Quinto acto, say "[if mercader is vivo]Escuchas los poderosos ronquidos del mercader.[otherwise]La estancia ha quedado en silencio tras tu acto.".

Instead of smelling when the player is in Quinto acto, say "El aire parece estar perfumado con ricas fragancias de oriente.".

Instead of taking or pulling or pushing or waving or attacking the telas, say "[italic type]'Las telas pueden tener algo de valor... pero el diamante es lo que hemos venido a buscar'[roman type], dice la musa.[paragraph break]".

Instead of pulling or pushing or waving or attacking the almohadas, try taking the almohadas.
Instead of taking or pulling or pushing or waving or attacking the cojines, try taking the almohadas.

Instead of taking the almohadas:
	if the almohada is nowhere:
		now the player carries the almohada;
		say "Suavemente coges una de las almohadas sin que el mercader se percate...[paragraph break][italic type]'Eso es, ahora hazlo...'[roman type], dice tu musa.[paragraph break]";
	otherwise:
		say "[italic type]'Ya tienes una almohada, [if the mercader is vivo]ya sabes lo que hay que hacer...'[roman type], dice tu musa.[else if the mercader is muerto]ahora coge lo que has venido a buscar...'[roman type], dice tu musa.[end if][paragraph break]".

Instead of taking or pulling or pushing or waving or attacking the mercader, say "No logras moverlo. [if the mercader is vivo]El mercader resopla pesadamente.[paragraph break][otherwise]Sin embargo, ya no sostiene el diamante con tanta fuerza...[paragraph break]".


Section 2 - El mercader

The mercader (m) is here. The mercader is a man and scenery. The mercader can be vivo or muerto. The mercader is vivo. The description of the mercader is "[if vivo]Un orondo mercader, vestido con ricas telas, tumbado sobre almohadas y cojines, cuyos ronquidos retruenan en la sala y enturbian la cegadora belleza del diamante que sostiene en sus manos.[else if muerto]El mercader ahora está sumido en un sueño más profundo.[end if]".
Understand "mirada", "gordo", "cabeza", "boca", "nariz", "nuca", "garganta", "rostro", "ojos", "mueca" and "hombre" as the mercader.
Some telas (f) are part of the mercader.

The description of the telas is "Sin duda sus ropas están tejidas con las telas más finas.". Understand "tela", "ropa" and "ropas" as the telas.

Instead of talking to the mercader, say "[if the mercader is vivo][italic type]'¡Silencio! No queremos que se despierte...'[roman type], dice tu musa.[paragraph break][otherwise][italic type]'Poco tiene ya que contar... céntrate en el diamante...'[roman type], dice tu musa.[paragraph break]".


Section 3 - Matar y robar

Instead of inserting the almohada into the mercader, try attacking the mercader.
Instead of putting the almohada on the mercader, try attacking the mercader.

Instead of attacking the mercader:
	if the mercader is muerto, say "Ya está muerto.";
	if the player carries the almohada and the mercader is vivo:
		now the mercader is muerto;
		say "Coges una de las almohadas y la colocas sobre el rostro del mercader, con fuerza y decisión.[paragraph break]";
		wait for any key;
		say "Pronto sus ronquidos se tornan en sonidos ahogados que no logras reconocer, manotea y mueve sus pies desacompasadamente, hasta que ya no lo hace.[paragraph break]";
		wait for any key;
		say "Retiras la almohada a un lado. Los ojos del mercader están abiertos de par en par, en una última mueca de sorpresa y terror.[paragraph break]";
	otherwise:
		say "No sabes con qué atacar, no hay nada a mano... [paragraph break][italic type]'Vamos, sabes como hacerlo...'[roman type], susurra la musa.".
		

Instead of pulling or pushing or waving or attacking the diamante, try taking the diamante.

Instead of taking the diamante:
	if the mercader is muerto:
		say "¡Ahora sí! ¡Ya es tuyo! Tus manos lo rozan y ya sientes el placer.[paragraph break]";
		wait for any key;
		say "Es cuando lo tienes entre tus manos cuando te encuentras de nuevo ante tu libro, pluma en mano.[paragraph break]";
		wait for any key;
		say "La musa sonrie maléficamente satisfecha. La página está esperando.[paragraph break]";
		now the mercader is vivo;
		now the almohada is in location;
		now the player carries the pluma;
		now the musa is espectante;
		increase the pecados by 1; [aumentamos el contador de pecados para que cambien los actos]
		now the score is 5; [se obtienen puntos según el acto realizado]
		wait for any key;
		clear the screen;
		now the player is in En la oscuridad;
	otherwise:
		say "El mercader mantiene entre sus manos el diamante con fuerza, no te permite llevártelo.[paragraph break]Se gira un poco y emite un perezoso resoplido.[paragraph break]".
		
	

Chapter 6 - Sexto acto

Sexto acto is a room. The description is "[if unvisited]Tu mente nublada se recupera del estallido de sensaciones contradictorias que te ha producido la sola visión de tu musa.[paragraph break][end if]Te encuentras ante una multitud de fieles que te aclaman como su señor, sus cánticos resuenan en la oscura noche. Eres el gran maestre. Un poco más allá puedes ver una pequeña hoguera..".

Some fieles (m) are here. They are scenery. The description of the fieles is "Los fieles recitan cánticos prohibidos. La muchedumbre espera la culminación del ritual.". Understand "muchedumbre", "gente", "acolitos", "cultistas" as the fieles.

A hoguera (f) is here. The hoguera is scenery. The description is "Una hoguera crepita en la noche. Ilumina débilmente el altar.". Understand "fuego" as the hoguera.


Section 1 - Acciones varias

Instead of listening when the player is in Sexto acto, say "Los cánticos de tus acólitos se escuchan guturales en la negra noche.".

Instead of talking to the fieles, say "[italic type]'¡Llevamos mucho tiempo esperando este momento!',[roman type] dices a tus fieles.[paragraph break]Tus acólitos se enfervorizan y sus cánticos se tornan ensordecedores.[paragraph break][italic type]'¡Esta será mi primera ofrenda para Lilith!',[roman type] gritas al cielo.[paragraph break]".

[Probar y oler la sangre]
Instead of smelling when the player is in Sexto acto, say "El dulce aroma de la sangre embriaga tus sentidos.".
Instead of smelling when the player is in altar, say "El dulce aroma de la sangre y las vísceras te embota los sentidos.".
Instead of smelling something edible when the player is in altar, say "El dulce aroma de la sangre y las vísceras te embota los sentidos.".
Instead of smelling something edible when the player is in Sexto acto, say "El dulce aroma de la sangre embriaga tus sentidos.".
Instead of tasting something edible when the player is in altar, say "Saboreas [the noun].[paragraph break][italic type]'¡Vamos! ¿A qué esperas?'[roman type], dice tu musa.".
Instead of tasting something edible when the player is in Sexto acto, say "Eso solo puedes hacerlo en el altar.".


[Atacar la hoguera]
Instead of taking or pulling or pushing or waving or attacking or touching the hoguera, say "Observas el crepitante fuego de la hoguera...[paragraph break][italic type]'No, el fuego podría matarte, eso no lo hagas...'[roman type], dice la musa.[paragraph break]".


[Comer el ternero en lugar de sus vísceras]
Instead of pulling or pushing or waving or attacking the ternero, say "El ternero está degollado, puedes ver sus vísceras y su corazón aún latiente, derramando sangre.[paragraph break][italic type]'¿Acaso no recuerdas como culminar el ritual?'[roman type], pregunta la musa.".

Instead of eating or drinking or tasting the ternero, say "[italic type]'¿Acaso no son sus vísceras, su corazón y su sangre lo que deseas?'[roman type], pregunta la musa.".


Section 2 - El altar

A altar (m) is in Sexto acto. "[if the player is in the altar]Estás en el altar de piedra, abajo están los fieles, esperando a la culminación del ritual. Frente a ti hay un ternero degollado. [otherwise]Estás frente a un improvisado altar hecho con piedras, encima de las cuales hay un ternero degollado.".
The description of the altar is "Es un altar de piedra, [if the player is in the altar]los fieles estan espectantes y sus cánticos se aceleran.[otherwise]los fieles esperan a que subas para empezar el ritual.".
The altar is a container, enterable, transparent and fixed in place. 
Some piedras (f), a piedra (f) and the ternero (m) are part of the altar.

The description of the piedra is "Una piedra maldita.".

The description of the ternero is "Un ternero degollado, forma parte del ritual. [if the player is in the altar]Los fieles estan espectantes y sus cánticos se aceleran.[otherwise]Los fieles esperan a que empieces el ritual.". 

Some visceras (f), the corazon (m) and the sangre (f) are edible and part of the ternero. The printed name of the visceras is "vísceras". The printed name of the corazon is "corazón".

The description of the visceras is "Contemplas las sanguinolentas entrañas del animal." Understand "entranas", "viscera", "entrana" as the visceras.

The description of the corazon is "El corazón del ternero palpita débilmente. Está fresco aún. Es el momento.".

The description of the sangre is "La sangre salpica en las piedras del altar. Su aroma te estimula a continuar con el ritual.".


[Subir y bajar del altar - sinónimos para entrar y salir, subir y bajar]
Instead of entering the altar:
	say "Subes al altar. La muchedumbre enloquece y sus cánticos se aceleran."; 
	now the player is in the altar.

Instead of going dentro when the player is in Sexto acto, try silently entering the altar.

Instead of going up in Sexto acto, try silently entering the altar.

Instead of getting off the altar:
	say "Bajas del altar. Tus acólitos se miran entre ellos extrañados."; 
	now the player is in Sexto acto.

Instead of going down when the player is in altar, try silently getting off the altar.

Instead of exiting when the player is in altar, try silently getting off the altar.


Section 3 - El ritual

[Coger la piedra]
Instead of examining or taking the piedra for the first time:
	now the piedra is portable;
	now the player carries the piedra;
	say "Observas una de las piedras que forman este altar madito. La recoges. Cabe perfectamente en la palma de tu mano. Servirá.[paragraph break][italic type]'Así es como debe ser'[roman type], dice la musa.[paragraph break]".
	
Instead of examining the piedras, say "Son las piedras que forman el altar. Son piedras malditas.".
Instead of taking the piedras, try taking the piedra.


[Comer las vísceras]
Instead of drinking some edible when the player is in Sexto acto, try eating the noun.

Instead of eating something edible when the player is in Sexto acto, say "Eso solo puedes hacerlo una vez estés subido al altar.[paragraph break]".

Instead of taking or smelling or tasting something edible when the player is in Sexto acto:
	say "¡Ah, [the noun]![paragraph break][italic type]'¡Cómete [the noun]!'[roman type], te dice la musa desde algún lugar invisible.[paragraph break]".
		
Instead of eating something edible when the player is in altar:
	if the piedra is carried:
		say "Acercas tu boca hacia [the noun], sintiendo una vez más el dulce sabor de la sangre de una criatura inocente. Los cultistas gritan de júbilo, el fuego de la hoguera crepita y se yergue entre la muchedumbre como un aciago fénix.[paragraph break]";
		wait for any key;
		say "El ritual se ha completado. Una última gota de sangre cae por entre la comisura de tus labios. El fuego se expande y los cánticos cesan a medida que los cuerpos se consumen en cenizas. Sólo queda ya el último acto...[paragraph break]";
		wait for any key;
		say "Lo que sucede después te sumerge de nuevo en la oscuridad más absoluta, pero de nuevo te ilumina la malévola luz de tu musa, que sonríe mientras espera que escribas de nuevo en el libro.[paragraph break]";
		now the player carries the pluma;
		now the musa is espectante;
		increase the pecados by 1; [aumentamos el contador de pecados para que cambien los actos]
		now the score is 6; [se obtienen puntos según el acto realizado]
		wait for any key;
		clear the screen;
		now the player is in En la oscuridad;
	otherwise:
		say "[italic type]'¿Acaso no recuerdas qué tienes que hacer antes de empezar con [the noun]?'[roman type], pregunta la musa.[paragraph break]";



Chapter 7 - Séptimo acto

Septimo acto is a room. The description is "[if unvisited]Tu mente nublada se recupera del estallido de sensaciones contradictorias que te ha producido la sola visión de tu musa.[paragraph break][end if]Estás caminando descalzo sobre tierra húmeda, recién labrada. Alzas la vista, parece que se avecina tormenta. [if the player carries the piedra]Tienes una piedra en tu mano. [end if]No recuerdas por qué sonríes satisfecho y temeroso a la vez.". The printed name of Septimo acto is "Séptimo acto".

The tormenta (f) is here. The description of the tormenta is "El cielo está nublado, amenaza tormenta.". The tormenta is scenery.
Understand "cielo", "nubes", "truenos", "relampagos" and "luz" as the tormenta.


Section 1 - Acciones varias

Instead of listening when the player is in Septimo acto, say "Escuchas los truenos de una fuerte tormenta que llega...".

Instead of smelling when the player is in Septimo acto, say "Se puede oler el embriagador aroma de la venganza.".


Section 3 - El pastor

The hermano (m) is here. "A lo lejos puedes ver de nuevo al pastor.". The hermano is a man. The litany of the hermano is the Table of Hermano Conversation. The description of the hermano is "Es un pastor orgulloso, el favorito de su padre.".
Understand "hombre", "pastor" as the hermano.

Table of Quip Texts (continued)
quip	quiptext 
mi-ofrenda	"[italic type]'Pero... ¿qué has hecho?'[roman type], pregunta tu hermano..."
ternero-hermano	"[italic type]'¿Cómo lo sabes?'[roman type], pregunta tu hermano..."
hola-hermano	"[italic type]'Así es, hermano. Por favor... ayúdame a encontrar un ternero, ¡debe haberse escapado!'[roman type]"

Table of Hermano Conversation
prompt	response	enabled 
"Ha sido mi ofrenda."	mi-ofrenda	0 
"El ternero no se ha escapado, hermano..."	ternero-hermano	0 
"Parece que se avecina tormenta..."	hola-hermano	1 

After quipping when the current quip is hola-hermano: enable the ternero-hermano quip;
After quipping when the current quip is ternero-hermano: enable the mi-ofrenda quip;
After quipping when the current quip is mi-ofrenda: 
	enable the mi-ofrenda quip;
	terminate the conversation.

Instead of pulling or pushing or waving or kissing or touching or smelling the hermano, say "[italic type]'¿Para qué te he dado esa piedra? ¡Vamos! ¡Lánzasela a tu hermano!'[roman type], dice la musa.[paragraph break]".


Section 3 - Venganza

Instead of attacking the hermano:
	if the player carries the piedra:
		try throwing the piedra at the hermano;
	otherwise:
		say "[italic type]'¿Para qué te he dado esa piedra? ¡Vamos! ¡Lánzasela a tu hermano!''[roman type], dice la musa.[paragraph break]";

Instead of throwing the piedra at the hermano:
	say "Lanzas la piedra a la cabeza de tu hermano, acertando de lleno. La sangre brota de sus sienes y cae a plomo sobre la tierra.[paragraph break]"; 
	wait for any key;
	say "Te acercas hacia el cuerpo moribundo y de nuevo coges la piedra. Alzas tus manos y golpeas una y otra vez el rostro de tu hermano. La sangre salpica tus brazos. [paragraph break]";
	wait for any key;
	say "La lluvia empieza a caer con fuerza. Te alejas del campo, dejando allí tu particular ofrenda. Deambulas por la tierra hasta que un rayo de luz emerge de entre las nubes, paralizándote...[paragraph break]";
	wait for any key;
	say "Del cielo surge una potente voz que te pregunta incesante: [italic type]'¿Dónde está tu hermano?'[roman type][paragraph break]Respondes: [italic type]'No lo sé, ¿acaso soy yo el guardián de mi hermano?'[roman type][paragraph break]";
	wait for any key;
	say "La voz desde el cielo grita: [italic type]'¿Qué has hecho? La sangre de tu hermano me está gritando desde la tierra. Por eso te maldice esa tierra que ha abierto sus fauces para recibir de tus manos la sangre de tu hermano.'[roman type][paragraph break]";
	wait for any key;
	say "Una lluvia negra de ceniza y roja de sangre brota del cielo, arrastrándote al negro abismo. Caes y caes durante siglos, sumiéndote en la más absoluta oscuridad... una oscuridad sólo soportable por la bella sonrisa de tu musa, que te recoge en sus brazos y te lleva de nuevo frente al libro, que espera tu escritura. [paragraph break][italic type]'Todo acaba. Todo comienza.'[roman type][paragraph break]";
	now the player carries the pluma;
	now the piedra is in altar;
	now the musa is espectante;
		now the pecados is 0; [volvemos a poner a cero el contador de pecados]
		wait for any key;
		disable the mi-ofrenda quip;
		disable the ternero-hermano quip;
		enable the hola-hermano quip;
		clear the screen;
		now the player is in En la oscuridad.


Part 4 - Publicando el juego

Chapter 1 - Ayuda

[Ayuda]

Table of Basic Help Options (continued)
title	subtable	description 
"Pistas"	Table of Hints	-- 
"Opciones"	--	"[line break]Además de los verbos básicos, tienes las siguientes opciones:[paragraph break][bold type]REINICIAR[roman type] - Para volver a comenzar la partida.[line break][bold type]GUARDAR[roman type] - Para grabar tu posición.[line break][bold type]CARGAR[roman type] - Para recuperar una posición guardada.[line break][bold type]INVENTARIO[roman type] - Para mostrar los objetos que llevas.[line break][bold type]PUNTOS[roman type] - Para mostrar tu actual puntuación.[line break][bold type]TRANSCRIPT[roman type] - Para transcribir el juego en un archivo de texto.[line break][bold type]DIALECTO SUDAMERICANO[roman type] - Para adecuar verbos al español de América.[line break][bold type]DIALECTO CASTELLANO[roman type] - Para adecuar verbos al español de España.[line break][bold type]FIN[roman type] - Para terminar la partida.[line break]"
"Contactar con el autor"	--	"¿Te has atascado? Puedes contactar conmigo escribiéndome un mensaje a mi cuenta de Twitter o Instagram: @XCarrascosa. Puedes pedir ayuda en los foros del CAAD (www.caad.es). También me puedes dejar un mensaje a través del formulario de contacto de mi web: www.xaviercarrascosa.com" 
"Poema de Roberto Menéndez"	--	"[line break][italic type]Maldita seas musa escurridiza,[line break]me entregas tus caricias y tu beso[line break]y junto las palabras cual poseso,[line break]hundiéndome en tu arena movediza.[paragraph break]Te marchas convirtiéndome en ceniza[line break]y siento sobre el cuello un lazo grueso[line break]que asfixia deseando tu regreso,[line break]creciendo esta obsesión casi enfermiza.[paragraph break]Maldita por mostrarme las estrellas,[line break]las risas, el azul, el universo,[line break]la luz, el llanto y tantas cosas bellas.[paragraph break]Te marchas y me muestras el adverso[line break]dejándome en mi pecho mil querellas,[line break]incapaz de escribir un solo verso.[roman type][paragraph break][bold type]Roberto Menéndez[roman type]"


Table of Hints
title	subtable	description	toggle 
"¿Qué tengo que escribir en el libro?"	Table of escribir-en-libro Hints	""	hint toggle rule 
"¿Cómo puedo resolver los actos?"	Table of resolver-los-actos Hints	""	hint toggle rule 
"¿Cómo puedo acabar con la musa?"	Table of acabar-con-musa Hints	""	hint toggle rule 


Table of escribir-en-libro Hints
hint	used 
"¿Has cogido la pluma ya? Sin la pluma no podrás escribir..."	a number
"¿Has probado a escribir algo? Por ejemplo [italic type]'ESCRIBE VERSO EN LIBRO'.[roman type]" 
"Puedes escribir lo que quieras, pero básicamente el juego entenderá una palabra, por ejemplo [italic type]'ESCRIBE AYUDA'.[roman type]"
"¿No se te ocurre sobre qué escribir? Es raro, la musa siempre te ofrece una nueva inspiración a cada acto."
"Debes escribir una palabra relacionada con tus actos y con los pecados cometidos. Es una de las dos maneras posibles de terminar con tu agonía."

Table of resolver-los-actos Hints
hint	used 
"Después de escribir en el libro, la musa espera que la mires. Solo así conseguirás la inspiración."	a number
"En el primer acto nos sentimos algo cansados. ¿Qué haces cuando estás cansado?" 
"En el segundo acto tenemos mucha comida disponible. ¿Qué haces cuando tienes hambre?"
"En el tercer acto podemos matar a un soldado con su propia arma."
"En el cuarto acto debemos hacer algo pecaminoso que es la razón por la cual este juego no es apto para menores."
"En el quinto acto hay algo que queremos y haremos lo necesario para conseguirlo."
"En el sexto acto debemos subir al altar y terminar con el ritual, pero también conseguir algo para el último acto."
"En el séptimo y último acto terminaremos drásticamente lo que en el primero nos dio pereza hacer."
"¿Has vuelto a empezar? ¡Claro! En eso consiste el tormento, así es la eternidad."

Table of acabar-con-musa Hints
hint	used 
"La primera pista es que no vas a acabar con la musa."	a number
"Aún así piensas que puedes librarte de ella. Tal vez hay una manera..." 
"Tras cada inspiración recuerdas más cosas de tus actos del pasado."
"Escribe sobre tus actos."
"Esos actos son ruines."
"Esos actos son malvados."
"Esos actos son los pecados originales."
"¿Qué podemos hacer para que Él nos perdone?"


Chapter 2 - Release

[Release]
Release along with the source text, a website and the "Quixe" interpreter.

