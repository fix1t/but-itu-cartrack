# Zpráva návrhu - ITU 

Členové týmů:
- Gabriel Biel (xbielg00)
- Adam Gabrys (xgabry01)
- **Jakub Mikyšek (xmikys03) - vedoucí**

TO-DO
- [x] 1. Navržené téma
- [x] 2. Vybrané téma
- [x] 3. Analýza uživatelských potřeb a klíčových problémů
- [ ] 4. Analýza existující aplikace
    - [x] xmikys
    - [x] xbielg
    - [ ] xgabry
- [x] 5. Uživatelské potřeby a klíčové problémy
- [ ] 6. Návrh aplikace - Rozdělení práce
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
- xbielg00:

## 4. Analýza existující aplikace

<span style="color:orange">SOLO</span>

- popsat
    - přednosti a nedostatky
- jak se budeme inspirovat a jak řešit nedostatky?
- lze se zeptat i uživatelů

#### Papírová podoba

#### Excel Tabulka (xmikys03)
Implementací tohoto problémů není opravdu mnoho, jedno z řešením může být sdílená excelová tabulka.
Mezi přednosti bych uvedl snadnou přenositelnost a přístupnost napříč všemi chytrými zařízeními bez nutnosti instalace. Oproti papírové podobě ještě můžeme vypíchnout již nějakou formu digitalizace.
Mimo to se ale jedná o variantu, která nemusí být vždy intuitivní a jednoduše může dojít k poškození či **ztrátě/smazání dat, při špatné manipulaci uživatelem**.
Řešení naší aplikace: Uživatel přidává data a nemůže editovat nebo mazat data, která již byla napsána jinými uživateli. 

#### Elektronická kniha jízd
 [Satelitni Sledovani Cz - Elektronická kniha jízd](https://satelitnisledovani.cz/funkce/elektronicka-kniha-jizd?gad=1&gclid=CjwKCAjwp8OpBhAFEiwAG7NaEtv_5M5m_w0kIFcoJ2FhajByzBRqAQhAaMwz79j_jqRGMVX71QCXCRoCLtIQAvD_BwE)  
[Kniha jízd Zdarma](https://www.kniha-jizd-zdarma.cz/o-systemu/o-nas/?ref=1&ref_id=5&search=)

Elektronická kniha jízd je produkt, který umožňuje monitorovat a evidovat jízdy vozidel pomocí GPS lokátorů. Produkt má některé funkce, které se zdají být užitečné jako je automatické zpracování dat, rozlišení typu a účelu jízdy, zobrazení jízd na mapě, pravidelné odesílání dat do účtárny, mobilní aplikace a připomínky a upozornění na servis a pojištění. 

Nicméně, produkt má také mnoho nedostatků. Mezi jeho nedostatky patří nutnost instalace GPS lokátorů do vozidel, nutnost spoléhat na kvalitu a dostupnost signálu GPS.

Produkt má různé ceny podle typu a funkčnosti GPS lokátorů, které se pohybují od 150 Kč do 200 Kč za měsíc za každý lokátor, plus jednorázová cena za koupi lokátoru, která se pohybují od 2 390 Kč do 5 590 Kč.

## 5. Uživatelské potřeby a klíčové problémy
 
<span style="color: #31c3d4">TEAM</span>

Na základě provedené analýzy uživatelských potřeb a existujících řešení jsme identifikovali několik klíčových potřeb a problémů, které naše aplikace bude řešit:

1. **Snadný a efektivní zápis jízd**: Uživatelé vyjádřili potřebu snadného a rychlého zaznamenání jízd, což zahrnuje jednoduché zadání koncového stavu tachometru.

2. **Sledování ujetých kilometrů**: Uživatelé chtějí mít přehled o tom, kolik kilometrů ujeli při každé jízdě, a to bez složitého ručního výpočtu.

3. **Centrální evidenci vozidel**: Profesionální řidiči ocenili možnost mít veškerá firemní vozidla pohromadě v jedné aplikaci a snadno vybírat konkrétní vozidlo pro každou jízdu.

4. **Asistenční služba a informace v případě potřeby**: Umožnění rychlého přístupu k asistenčním službám nebo informacím o postupu v případě nehody nebo poruchy vozidla bylo vnímáno jako užitečná funkce.

5. **Historie jízd a rychlé vyhledávání**: Uživatelé chtějí mít možnost sledovat historii svých jízd a rychle vyhledávat konkrétní záznamy.

6. **Uchování a výpočet tachometru**: Aplikace by měla uchovávat stav tachometru z předchozích jízd a umožnit uživatelům snadno spočítat nově ujeté kilometry.

7. **Detaily o vozidle**: Možnost zobrazit informace o jednotlivých vozidlech, včetně typu paliva, je pro uživatele důležitá.

8. **Poznámky a komunikace mezi uživateli**: Někteří uživatelé chtějí možnost přidávání poznámek nebo komunikace ohledně vozidel a jízd.

Tyto klíčové potřeby a problémy budou zohledněny při návrhu a vývoji naší aplikace, abychom poskytli uživatelům efektivní a uživatelsky přívětivé řešení pro správu knihy jízd a souvisejících úkolů.

## 6. Návrh aplikace - Rozdělení práce
 
<span style="color: #31c3d4">TEAM</span>

Rozhodli jsme se pro 2. způsob - rozdělení částí aplikace.

Rozdělení práce:
- xmikys03:
- xgabry01:
- xbielg00:

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

## 9. Technické řešení + technologie
 
<span style="color: #31c3d4">TEAM</span>

- Flutter, ...
