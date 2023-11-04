# Zpráva návrhu - ITU 

Členové týmů:
- Gabriel Biel (xbielg00)
- Adam Gabrys (xgabry01)
- **Jakub Mikyšek (xmikys03) - vedoucí**

TO-DO
- [ ] 4. Analýza existující aplikace
    - [x] xmikys
    - [x] xbielg
    - [ ] xgabry
- [x] 5. Uživatelské potřeby a klíčové problémy
- [x] 6. Návrh aplikace - Rozdělení práce
- [ ] 7. Návrh aplikace - Návrh makety
    - [ ] xmikys
    - [ ] xbielg
    - [ ] xgabry
- [ ] 8. Návrh aplikace - Testování
    - [ ] xmikys
    - [ ] xbielg
    - [ ] xgabry
- [ ] 9. Technické řešení + technologie
- [ ] A. Odebrat SOLO/TEAM, poznámky a TO-DO
- [ ] B. Rozsah: 10-12 normostran
- [ ] C. Titulní strana


## 1. Navržené téma

#### Duosomethingo - Aplikace pro sebevzdělání (xmikys03)
Můj nápad byl vytvořit aplikaci rozšiřující a spojující vzdělávací aplikace jako Duolingo (pro cizí jazyky) a Flashcards (pro zapamatování pojmů). Celá aplikace by měla pojmout témata primárně v oblastech IT světa, například - Řecká abeceda, rozpoznání elektrotechnických součástek, procvičování návrhových vzorů. Způsob procvičování by byl od formy vybírání z 4 možností, přes spojování pojmů až po doplňování názvů uživatelem. 

#### CarTrack - Elektronická kniha jízd (xgabry01)
Nápad vznikl se zaměřením na profesionální řidiče, kdy jsem je nejednoul slyšel stěžovat si na zápis do papírové knihy jízd. S tímto přišel nápad na vytvoření elektronické knihy jízd pro firmy/profesionální řidiče. V aplikaci by bylo možné si vybrat z nabídky aut vlastněné firmou konkrétní vozidlo použité při jízdě a pouze zadat konečný stav tachometru. V aplikaci by se zobrazil počet ujetých kilometrů za jízdu, jelikož by si aplikace uchovávala všechny záznamy a odečetla by nejnovější záznam tachometru od záznamu minulé jízdy. V úvahu padla i možnost rozšířit aplikaci o informaci o konkrétních autech či tlačítko 'Potřebuji pomoc', kdy by se uživateli zobrazilo číslo na asistenční službu/ZS či jak postupovat v případě nehody. 

#### Restauranto - Aplikace pro číšníky (xbielg00)
Mým nápadem je vytvořit aplikaci "Restauranto" pro číšníky, která zjednoduší jejich práci a zlepší zážitek hostů v restauracích. Klíčové funkce zahrnují:

**Rozložení stolů**: Možnost rychlé úpravy uspořádání stolů v restauraci.
**Jednoduché objednávání**: Hosté mohou snadno objednávat jídlo a nápoje přes aplikaci.
**Přidávání poznámek**: Možnost specifikace individuálních požadavků hostů.
**Dělení účtů**: Snadné dělení účtů mezi různými osobami.
**Přesun stolů**: Možnost rychlého přesunu stolů podle potřeby.
**Tisk účtů**: Rychlý tisk účtů pro zrychlení procesu odchodu hostů.

Tímto by se vytvořila aplikace, která by zefektivnila práci číšníků a zlepšila celkový zážitek hostů v restauracích.


## 2. Vybrané téma

Po zhodnocení jsme zvolili variantu firemní aplikace pro efektivní správu jízd aut na způsob Knihy jízd. Varianta se nám zdála být nejpraktičtější a zároveň nejzajímavější pro implementaci a návrh. Při výběru jsme brali v úvahu osobní zkušenosti s tímto tématem.

## 3. Analýza uživatelských potřeb a klíčových problémů

Otázky byly typu **ANO/NE**, **bodové ohodnocení 1**(rozhodně ne) **- 5**(rozhodně ano), **výběr z odpovědí** nebo **otevřená odpověď**.

### Otázky použité v dotazníku:
1. _Používali jste někdy knihu jízd nebo něco tomu podobného?_

    Z dotazníku vidíme, že více než 2/3 respondentů má s knihou jízd nějaké zkušenosti.

2. _Používáte pro zápis služebních cest něco jiného než papírovou knihu jízd? Pokud něco jiného, co?_

    Zde se objevila pouze 1 odpověď: `Elektronickou variaci v podobě Google sheetu`. Za povšimnutí stojí, že nikdo z tázaných nemá zkušenost s žádnou formou aplikace, klidně i nějaké interní.
    
3. _Jste spokojení se zapisováním do papírové knihy jízd (pokud ji používáte)?_

    Setkáváme se zde s celou řadou různorodých odpovědí - 2 lidé jsou spokojeni, 4 jsou neutrální, 3 se přiklání spíše, že spokojeni nejsou a 1 člověk není spokojen. Pro někoho staré dobré zapisování na arch papírů může být v pořádku a někdo to už ani nemůže vystát.

4. _Líbí se vám myšlenka jednoduchého zápisu koncového stavu kilometrů do aplikace?_

    90% odpovědí bylo pro myšlenku chytrého zapisování v aplikaci, má to smysl!

5. _Vnímáte jako výhodu mít v aplikaci všechna firemní auta pohromadě a jednoduše si z nabídky pouze vybrat auto, které jste použili?_

    U této odpovědi, stejně jako u té předchozí se setkáváme s velmi kladnou vlnou odpovědí **přes 80% by tuto funkci určitě uvítalo**. Tuto funkcionalitu bude tedy určitě dobré naimplementovat.

6. _Prováděli byste raději výběr auta z nabídky pomocí firmou zvoleného názvu nebo pomocí SPZ?_

    <figure>
        <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/94748640/278081132-42150c51-b4e6-4418-a4c7-ce4b45631f9f.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20231025%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20231025T162726Z&X-Amz-Expires=300&X-Amz-Signature=c8d7a676099210dc66b6f1903ca1286366096b47441700fddea2d3e3319889b6&X-Amz-SignedHeaders=host&actor_id=94748640&key_id=0&repo_id=701465030"
            alt="Graf volba SPZ/jméno auta">
        <figcaption>Nejlepší volbou z pohledu uživatelů je vyhledávání pomocí SPZ i názvu auta.</figcaption>
    </figure>

7. _Vnímáte jako výhodu si pouze vybrat vašeho uživatele z nabídky aplikace místo repetitivního zapisování vašeho jména do knihy jízd?_

    Opětovně se **90%** dotazovaných vyjádřilo **velmi pozitivně**, jen 1 zůstal neutrální. Výběr uživatele v aplikaci je důležitá funkce pro pohodlné používání.

8. _Ocenili byste mít v aplikaci číslo na asistenční službu, kterou máte placenou z vašeho povinného ručení a tím předejít placení navíc/hledání jakou službu firma používá?_

    <figure>
        <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/94748640/278084580-1988b5f7-df64-49a0-a82a-639aeb490dac.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20231025%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20231025T163827Z&X-Amz-Expires=300&X-Amz-Signature=18eabe0051aded391bf26169169317eb3618922adf5ad87294821ae28e6f99f9&X-Amz-SignedHeaders=host&actor_id=94748640&key_id=0&repo_id=701465030"
            alt="Graf volba SPZ/jméno auta">
        <figcaption style="text-align: center;">Zde už popularita klesala, i přesto by o to někteří měli zájem.</figcaption>
    </figure>
    
9. _Ocenili byste kdyby aplikace umožňovala také uvádět záznamy o tankování jednotlivých aut?_

    Tady již se vyjádřilo pozitivně trochu více lidí (přes 80% hlasovalo pro hodnocení 4 nebo lepší). V otevřené reakci na konci dotazníku jsme získali dobrý podnět, že by bylo žádoucí vidět i momentální stav nádrže - ne jenom to, kdy bylo naposledy natankováno.

10. _Ocenili byste možnost přidání poznámek k jednotlivým autům? (např. zanechání vzkazu pro ostatní řidiče, kde jste uložili technický průkaz či přidání záznamu o poruše/nehodě)_

    Pozitivně byla hodnocena i tato funkčnost, pro hodnocení 5 hlasovalo 65% respondentů (pozitivní přes 80%).

11. _Ocenili byste tlačítko "Potřebuji pomoct", kdy by se vám po stisknutí zobrazilo info, jak postupovat v případě nehody/poruchy i např. s číslem na asistenční službu či ZS._

    U této otázky se naopak vyjádřilo pozitivně **jen 50% respondentů**, zbytek u tuto funkci nemá zájem.

12. _Líbilo by se vám, kdyby si aplikace uchovávala stav tachometru z předchozích jízd a při zadání konečného stavu kilometrů po vaší jízdě vám zobrazila počet nově najetých kilometrů?_

    Naopak tato otázka sklidila **90% pozitivních reakcí** (80% pro hodnocení 5). Případní uživatelé by o tuto funkci, která by eliminovala potřebu něco dopočítávat "z hlavy" nebo na kalkulačce, měli opravdu zájem.

13. _Ocenili byste mít možnost zobrazit si detail auta? Jednalo by se např. o typ paliva (DIESEL/BENZÍN)._

    Detail vozidla se zdá být také důležitý (5 - 72%, 4 - 18%), s čísel jde vidět, že by funkce mohla být žádaná.

14. _Uvítali byste ještě nějakou další funkcionalitu aplikace kromě výše popsaných?_ 

    Respondenti zvažovali následující rozšiřující funkcionality:
    - Zapsání účelu jízdy
    - Možnost zpětného editování
    - Zobrazení historie používání vozidla
    - Zobrazení stavu nádrže (málo, hodně...)

Respondenti:
- xmikys03: Michal B. (bývalý řidič rozvozu KFC), David Š. (COO v ARBO, jízda firemním autem s kameramami pro skenování stromů), Samuel Č. (Wolt řidič), Patrik K. (bezpečností specialista v Red Hat), Michal H. (PHP developer)
- xgabry01: Jan K. (profesionální řidič nákladních vozidel), Veronika K. (řidička pro nemocniční zásobování)
- xbielg00: Ludmila M. (zdrvotní sestra v terénu), Patrik Š. (podnikatel)

## 4. Analýza existující aplikace

- popsat
    - přednosti a nedostatky
- jak se budeme inspirovat a jak řešit nedostatky?
- lze se zeptat i uživatelů

#### Papírová podoba (xgabry01)

#### Excel Tabulka (xmikys03)
Implementací tohoto problémů není opravdu mnoho, jedno z řešením může být sdílená excelová tabulka.
Mezi přednosti bych uvedl snadnou přenositelnost a přístupnost napříč všemi chytrými zařízeními bez nutnosti instalace. Oproti papírové podobě ještě můžeme vypíchnout již nějakou formu digitalizace.
Mimo to se ale jedná o variantu, která nemusí být vždy intuitivní a jednoduše může dojít k poškození či **ztrátě/smazání dat, při špatné manipulaci uživatelem**.
Řešení naší aplikace: Uživatel přidává data a nemůže editovat nebo mazat data, která již byla napsána jinými uživateli. 

#### Elektronická kniha jízd (xbielg00)
 [Satelitni Sledovani Cz - Elektronická kniha jízd](https://satelitnisledovani.cz/funkce/elektronicka-kniha-jizd?gad=1&gclid=CjwKCAjwp8OpBhAFEiwAG7NaEtv_5M5m_w0kIFcoJ2FhajByzBRqAQhAaMwz79j_jqRGMVX71QCXCRoCLtIQAvD_BwE)  

Elektronická kniha jízd je produkt, který umožňuje monitorovat a evidovat jízdy vozidel pomocí GPS lokátorů. Produkt má některé funkce, které se zdají být užitečné jako je automatické zpracování dat, rozlišení typu a účelu jízdy, zobrazení jízd na mapě, pravidelné odesílání dat do účtárny, mobilní aplikace a připomínky a upozornění na servis a pojištění. 

Nicméně, produkt má také mnoho nedostatků. Mezi jeho nedostatky patří nutnost instalace GPS lokátorů do vozidel, nutnost spoléhat na kvalitu a dostupnost signálu GPS.

Produkt má různé ceny podle typu a funkčnosti GPS lokátorů, které se pohybují od 150 Kč do 200 Kč za měsíc za každý lokátor, plus jednorázová cena za koupi lokátoru, která se pohybují od 2 390 Kč do 5 590 Kč.

## 5. Uživatelské potřeby a klíčové problémy

Na základě provedené analýzy uživatelských potřeb a existujících řešení jsme identifikovali několik klíčových potřeb a problémů, které naše aplikace bude řešit:

1. **Snadný a efektivní zápis jízd**: Uživatelé vyjádřili potřebu snadného a rychlého zaznamenání jízd, což zahrnuje jednoduché zadání koncového stavu tachometru.

2. **Sledování ujetých kilometrů**: Uživatelé chtějí mít přehled o tom, kolik kilometrů ujeli při každé jízdě, a to bez složitého ručního výpočtu.

3. **Centrální evidenci vozidel**: Profesionální řidiči ocenili možnost mít veškerá firemní vozidla pohromadě v jedné aplikaci a snadno vybírat konkrétní vozidlo pro každou jízdu.

4. **Asistenční služba a informace v případě potřeby**: Umožnění rychlého přístupu k asistenčním službám nebo informacím o postupu v případě nehody nebo poruchy vozidla bylo vnímáno jako užitečná funkce.

5. **Historie jízd a rychlé vyhledávání**: Uživatelé chtějí mít možnost sledovat historii svých jízd a rychle vyhledávat konkrétní záznamy.

6. **Uchování a výpočet tachometru**: Aplikace by měla uchovávat stav tachometru z předchozích jízd a umožnit uživatelům snadno spočítat nově ujeté kilometry.

7. **Detaily o vozidle**: Možnost zobrazit informace o jednotlivých vozidlech, včetně typu paliva, je pro uživatele důležitá.

8. **Poznámky a komunikace mezi uživateli**: Někteří uživatelé chtějí možnost přidávání poznámek nebo komunikace ohledně vozidel a jízd.

9. **Zaznamenání účelu jízdy**: Dle požadavků jsme vyhodnotili přidání účelu jízdy (typ) jako vhodné rozšíření našich nápadů.

Tyto klíčové potřeby a problémy budou zohledněny při návrhu a vývoji naší aplikace, abychom poskytli uživatelům efektivní a uživatelsky přívětivé řešení pro správu knihy jízd a souvisejících úkolů.

## 6. Návrh aplikace - Rozdělení práce

Rozhodli jsme se pro 2. způsob - rozdělení částí aplikace do jednoho společného celku.

Rozdělení práce:
- xmikys03: menu pro výběr aut, editace a přidání aut
- xgabry01: základní komponenty, uživatel - registrace a výběr
- xbielg00: zapisování kilometrů a detaily s tím spojené

## 7. Návrh aplikace - Návrh makety
 
<span style="color:orange">SOLO</span>

- jak řeší potřeby uživatele (bod 5)
- obrázky, diagramů, snímů obrazovky
- krátky popis

## 8. Návrh aplikace - Testování

<span style="color:orange">SOLO</span>

- metriky + vyhodnocení
- jak probíhalo testování
- jaké odhalilo nedostatky
    - řešení nedostatků

Uživatelům, kterým bylo umožněněno testovat náš návrh aplikace byla zpřístupněna funkční maketa ve webové aplikaci Figma.

Nedostatky odhalené při používání se vyskytly v následujícíh scénářích:
- **Nemožnost se vrátit o krok zpět**
    - Častá nespokojenost směřovala k nemožnosti vrátit se zpátky, uživatelé se zaseknuli a nevěděli, jak v programu pokračovat, v tomto ohledu budeme muset doimplementovat možnost nějaké zpětné šipky pro vrácení se o krok dozadu, je možné implementovat i z hlediska gesta (potáhnutí doprava, jak jsou standartně novodové OS telefonů tvořeny)
- **Hláška o provedení akce**
    - Připomínka od uživatele David Š. směřovala na nedostatek/až absenci chybových a úspěšných hlášek, podle testera bylo dobře zvolené červené podbarvení tlačítka v chybovém stavu, ale navíc by si přál získat i text s konkrétní chybou, to stejné pro úspěch např. vytvoření/smazaní uživatele nám bude doprovázet hláška o úspěchu
    
Testeři: Michal B., David Š. (bližší informace o uživatelech poskytnuty v sekci pro dotazníky)

## 9. Technické řešení + technologie
 
<span style="color: #31c3d4">TEAM</span>

Pro náš projekt jsme jednoznačně zvolili technologii **Flutter** pro vývoj mobilní aplikace. Flutter je známý svou výkonností, rychlostí vývoje a schopností poskytnout křížovou kompatibilitu mezi *iOS* a *Android* platformami.

Architektura naší aplikace bude postavena na návrhovém vzoru **MVC** (Model-View-Controller). **Model** bude obsahovat *datové struktury* pro ukládání informací o jízdách, vozidlech a uživatelích, a bude propojen s **Firebase databází**. Bude také zahrnovat funkce pro zpracování dat, výpočet kilometrů a uchovávání historie jízd. **View** bude zodpovědné za vizuální reprezentaci aplikace a uživatelské rozhraní, zatímco **Controller** bude obsahovat aplikační logiku, která řídí interakci mezi modelem a view.

**Architektura FE**:
- **Model (Data)**: V FE budeme používat datový model pro uchovávání informací o uživatelích, firmách, autech, jízdách, poznámkách a výdavcích. Firma má uživatele, kteří přidávají jízdy jednotlivým autům. Uživatelé mohou také přidávat poznámky a záznamy o výdajích za auto. Auta, která existují v rámci firmy, mají několik důležitých atributů, jako je počet ujetých kilometrů a další relevantní údaje.

- **View (Uživatelské rozhraní)**:
    - **Login (Přihlášení do firmy)**: První obrazovka, kde uživatel zadá přihlašovací údaje pro přístup do firmy.
    - **User List (Seznam uživatelů)**: Seznam všech uživatelů v rámci firmy s možností výběru jednoho uživatele pro zobrazení detailů.
    - **User Edit (Úprava uživatele)**: Umožní uživateli upravit svůj profil (např. jméno, kontakt).
    - **Car List (Seznam vozidel)**: **Hlavní obrazovka**  s výpisem všech vozidel v rámci firmy.
    - **Car Detail (Detail vozidla)**: Zobrazí informace o konkrétním vozidle, včetně jeho technických údajů a historie jízd.
    - **Car Edit (Úprava vozidla)**: Umožní úpravu informací o vozidle (např. SPZ, typ paliva).
    - **Add Ride (Přidání jízdy)**: Obrazovka **akce**, kde uživatel, pro vybrané vozidlo, zadáva údaje o jízdě.
    - **Add Expense (Přidání výdaje)**: Přidání nového výdaje k vozidlu.
    - **Add Note (Přidání poznámky)**: Přidání poznámky k vozidlu.
    - **List Rides (Seznam jízd)**: Zobrazí seznam všech jízd auta.
- **Controller (Řídící logika)**: Řídící část aplikace, která bude zprostředkovávat interakci mezi Modelem a View. Bude obsahovat funkce pro zpracování uživatelských akcí, validaci dat a komunikaci s backendem.

**Architektura BE (Firebase)**:
   - **Firebase Realtime Database (Databáze)**: Použijeme Firestore jako databázi pro ukládání uživatelských dat, jízd, výdajů a poznámek. Firestore poskytuje snadnou synchronizaci dat mezi FE a BE.
   - **Firebase Authentication (Autentizace)**: Pro případnou autentizaci uživatelů by jsme využívali Firebase Authentication.


**Použití Firebase Realtime Database a API**:

V rámci naší aplikace jsme se rozhodli využít *Firebase Realtime Database* pro ukládání a správu dat. Firebase Realtime Database poskytuje cloudové úložiště s reálným časem, které je vhodné pro naše potřeby. Díky této volbě **nemusíme implementovat tradiční backend server s explicitními API endpointy**, protože Firebase nám umožňuje přistupovat k datům **přímo z frontendu**.

Pro komunikaci s Firebase Realtime Database v naší aplikaci budeme používat balíček `firebase_database` pro Flutter.

Při získávání dat z databáze v naší aplikaci budeme vytvářet reference na konkrétní cesty (kolekce a dokumenty) v databázi a následně provádět operace nad těmito daty. Například pro získání dat konkrétního uživatele budeme používat následující kód:

```dart
import 'package:firebase_database/firebase_database.dart';

final DatabaseReference usersRef = FirebaseDatabase.instance.reference().child('users');

void fetchUserData(String userID) {
  usersRef.child(userID).once().then((DataSnapshot snapshot) {
    if (snapshot.value != null) {
      Map<dynamic, dynamic> data = snapshot.value;
      // Zde můžeme provádět operace s daty
      print('Jméno uživatele: ${data['name']}');
    }
  });
}
```

V tomto příkladu vytváříme referenci na cestu users v databázi a následně získáváme data konkrétního uživatele na základě jeho ID. Získaná data můžeme dále zpracovat v naší aplikaci.

Tímto způsobem budeme komunikovat s Firebase Realtime Database, a to včetně operací pro **získání, aktualizaci, přidání** a **mazání** dat podle potřeby v naší aplikaci.

**tasks**:

<span style="color: #31c3d4">TEAM</span>  

- [ ] kostra aplikace
- [ ] základní datový model (stačí jednoduchá datová struktura) -- tedy napojení na ezpez databázi
- [ ] minimální funkčnost BackEndu - Operace Create a Read

<span style="color:orange">SOLO</span>

- [ ] nainstalované vývojové prostředí
- [ ] doplnění kostry o svůj GUI prvek a napojení na BE, stačí **jedno tlačítko** k odeslání požadavku/zavolání funkce a textový GUI element k zobrazení výsledku.
    - [ ] třeba si jen zavolat soubor s databází aut
    - [ ] další z nás s databází uživatelů a ty listy zobrazit
    - [ ] třeba zobrazit detail 1 uživatele.
