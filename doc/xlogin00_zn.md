# Zpráva návrhu - ITU 

Členové týmů:
- Gabriel Biel (xbielg00)
- Adam Gabrys (xgabry01)
- **Jakub Mikyšek (xmikys03) - vedoucí**

TO-DO
- [ ] A. Rozsah: 10-12 normostran
- [ ] B. Titulní strana
- [ ] C. Kontrola pravopis zprávy
- [ ] D. Zabalit kostru do zip
- [ ] E. Odebrat TO-DO


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

<figure style="margin: 0 auto;
    text-align: center;">
    <img src="https://lh3.googleusercontent.com/pw/ADCreHee4HZG0wvxfqQ5T_KrIurLwTU0j4S7VIWsN8aqAsVfjyTrKUrgbPd5K06cTwKpVrzVsErY17YTz0qI9R0S16wd9BQCXpDYuQ2-pcWKZZoKQrlwlt4ANetCNqQa_7TZ7-EgXi8WgPvsj4c07ynicMo_hGswOQjEzaltGVVjG5JSvdD--w9CFXnDRSci2WvlULlSQfHJOb_0V7ButS-E2U8lgGZqr8qYHEGyKAV8jO0kdufONmC5L3_Vk2TEUsog93TOdSahILrWPBomrPnydNNGNfw_3j7EEKSZ5ITmZbzDGgNq0aijzixpzTyMqMRQLRKJ5rxVZiRaMz2boBD1sFuBwO10ckiocgzeVMwY8ljeyjEkcOpjenvo78eMpVWgoS_WqZT-0Q8s-lon8XGCgx284h1MzOlb02j1DY-Atn4FAu11ArfAij-IyF1ZigpaF2Au0NvJ7KMbfsB4uSEgytNgiUCRGAu5n5xJYNjOX3tLIRhE8qGyBy3xiZ_UxmKoE9q4xmxjOhfUiB-ZUv7KO9oDNyG8F2OdE1xmBchmjpH3-DmjPj9zQE8UXgSeKZ2UGG--ci5abUs4aoK07SaSF64NuDUe2J-eCoH2EIrNe-KqMurdhnu6ouNd1VoEJ0nEy4iplnpGVOaTz_MzynOWqN44ABa_4S0IlrnmpAiqMfPo-79xjBTMbs8HA3O7PPLZ4T6SVXvh4-76rS5dwqk2uzMmbm8146flMfzSZfCGvKaZVT6DEh7vuf4o1vs1zKj6x4VJNODRHKC9mCrXCRYJsHV0MORRjm3RNJ8AKKlPlOrfpxalh5YEE0P_1xTqfBnp-_9TeKqKBzH_bH0wVQ5zHdS0YBJfnmU0kKTF5L3IC7X7nXecjj9l5q6Ek0k8LEtOgeJGL4oYVzp7_2DgcugWgcY5UnG-7Sv0i2H9c4N3-9Qdk8IGkOyoyKgZXard-8Q9psTIx3yMPJG6Df_jRFrJ4eD4MaRyA8cyzJoFihsTbtHNvY-DyhdG6fQUKfMKm_pEIsuM=w495-h246-s-no-gm?authuser=0"
        alt="Graf volba SPZ/jméno auta">
    <figcaption>Nejlepší volbou z pohledu uživatelů je vyhledávání pomocí SPZ i názvu auta.</figcaption>
</figure>

1. _Vnímáte jako výhodu si pouze vybrat vašeho uživatele z nabídky aplikace místo repetitivního zapisování vašeho jména do knihy jízd?_

    Opětovně se **90%** dotazovaných vyjádřilo **velmi pozitivně**, jen 1 zůstal neutrální. Výběr uživatele v aplikaci je důležitá funkce pro pohodlné používání.

2. _Ocenili byste mít v aplikaci číslo na asistenční službu, kterou máte placenou z vašeho povinného ručení a tím předejít placení navíc/hledání jakou službu firma používá?_

<figure style="margin: 0 auto;
    text-align: center;">
    <img src="https://lh3.googleusercontent.com/pw/ADCreHehq2rScd9PyC4tx3hJsbnGmTFWDJMzV8VNx98QEDYPK1AYBGat35A8p8eaJlfdjxQg6CEjyCneB-BeKk3ae23V3Dd7LYkWlXgYe_RJ1S5bv7ZzzkZIcR706wGBEkcATfezSL88-fjRPTSCWMacCW7xW_sIu8Zke6UWcX172kIdOJ8RiQ-XkYAED2AbkEX6lUogwAw2qI2uuLyllMZqH12nr5qyQBFcw32Q7Lvn-RjARYXs2o_av_uk6igxOCe8evRK0eranzWBYFHZP4l4KHX51IB-yOIDY4t52jLwL7st6Or1oYoWHkNVclR61hd2kcpnWqxKvY0h_lwz7n1FkvtSRXf0ttpZnIg0psjhD2Lpy5g93zrmd_0-cgt2Z2ZXM0k6hWWoRQgS3l9oCL-62EwBBV7ZO9YOFyDhMUAII7UJaon5i3Si3qQIporsPAjQ8ZqubqDpf4QWbbejq39Usrk0cStJ2f2-TCjmCRYt3SrqqxZ1rheI9UcWJXzZfRkQSpMUoNoyErDZhhCdIb_pQMS_wI1IvCT4DNJ8PIo9RLOZ-Utzb5JWLcXBtncV-q-NhUW67Z-_ZWzxB0GV6XCDJXv_f850fCzYYv74yOLs-1U9RJQanV0uUT9cw1Pw_oQAKU-K-lMibUP6KmoaFTVrOHIjrbCXilpEBDrBXM0G3NjpH9lsGjw8VwhMeO1Xtz8qqS3EYNNnutqDgzUN6ktyWvZfANYOFXv6OtwAg5P1dW-rLqXXNv620YxCYbSNe4V8kh1pZxky_2muWo45XBo2gxdeaTDCwd4wGPMqiZGImUoVKvRLbr8n8Tuyq3hN9XYceQtwf3OyZdsFNyZkNzk9Dgpl6n0uzMDyXnqLD4VjsWZVFgNiGuZQ8m504XvJGsPw0BbmYogM_50XnXtM1tmFCg7gIMW_0Pk3454l9f_qzLcjWrsfcH4SKj4SdoxQtUqER4Q1OJb2C06p-h8PdCqelv8n35QS6eyzvH7V971ffqt7YhcnR8w0qsqZq9RbfERcVCZO=w703-h235-s-no-gm?authuser=0"
        alt="Graf volba SPZ/jméno auta">
    <figcaption>Zde už popularita klesala, i přesto by o to někteří měli zájem.</figcaption>
</figure>
    
1. _Ocenili byste kdyby aplikace umožňovala také uvádět záznamy o tankování jednotlivých aut?_

    Tady již se vyjádřilo pozitivně trochu více lidí (přes 80% hlasovalo pro hodnocení 4 nebo lepší). V otevřené reakci na konci dotazníku jsme získali dobrý podnět, že by bylo žádoucí vidět i momentální stav nádrže - ne jenom to, kdy bylo naposledy natankováno.

2.  _Ocenili byste možnost přidání poznámek k jednotlivým autům? (např. zanechání vzkazu pro ostatní řidiče, kde jste uložili technický průkaz či přidání záznamu o poruše/nehodě)_

    Pozitivně byla hodnocena i tato funkčnost, pro hodnocení 5 hlasovalo 65% respondentů (pozitivní přes 80%).

3.  _Ocenili byste tlačítko "Potřebuji pomoct", kdy by se vám po stisknutí zobrazilo info, jak postupovat v případě nehody/poruchy i např. s číslem na asistenční službu či ZS._

    U této otázky se naopak vyjádřilo pozitivně **jen 50% respondentů**, zbytek u tuto funkci nemá zájem.

4.  _Líbilo by se vám, kdyby si aplikace uchovávala stav tachometru z předchozích jízd a při zadání konečného stavu kilometrů po vaší jízdě vám zobrazila počet nově najetých kilometrů?_

    Naopak tato otázka sklidila **90% pozitivních reakcí** (80% pro hodnocení 5). Případní uživatelé by o tuto funkci, která by eliminovala potřebu něco dopočítávat "z hlavy" nebo na kalkulačce, měli opravdu zájem.

5.  _Ocenili byste mít možnost zobrazit si detail auta? Jednalo by se např. o typ paliva (DIESEL/BENZÍN)._

    Detail vozidla se zdá být také důležitý (5 - 72%, 4 - 18%), s čísel jde vidět, že by funkce mohla být žádaná.

6.  _Uvítali byste ještě nějakou další funkcionalitu aplikace kromě výše popsaných?_ 

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
Nejklasičtější podoba Knihy jízd, která se nachází v každém autě firmy, pokud tuto podobu používá. Tyto knihy jsou obvykle v tištěné formě a jsou používány pro účely evidování a správy firemních nebo osobních vozidel. Je třeba do ni ručně zapisovat všechny údaje a velkou nevýhodou je nezálohovatelnost těchto údajů v případě ztráty jednotlivých knih. Každý uživatel má také jiný rukopis, takže je také někdy obtížné dané záznamy přečíst. Výhodou je však pořizovací cena a snadné zacházení. Díky aplikaci, kterou chceme implementovat se snažíme všechny tyto problémy eliminovat a to jak naimplementovat jednoduché zadávání koncového stavu kilometrů, tak jistou čitelnost údajů i zálohovanost dat.

#### Excel Tabulka (xmikys03)
Implementací tohoto problémů není opravdu mnoho, jedno z řešením může být sdílená excelová tabulka.
Mezi přednosti bych uvedl snadnou přenositelnost a přístupnost napříč všemi chytrými zařízeními bez nutnosti instalace. Oproti papírové podobě ještě můžeme vypíchnout již nějakou formu digitalizace.
Mimo to se ale jedná o variantu, která nemusí být vždy intuitivní a jednoduše může dojít k poškození či **ztrátě/smazání dat, při špatné manipulaci uživatelem**.
Řešení naší aplikace: Uživatel přidává data a nemůže editovat nebo mazat data, která již byla napsána jinými uživateli. 

#### Elektronická kniha jízd (xbielg00)
 [Satelitni Sledovani CZ - Elektronická kniha jízd](https://satelitnisledovani.cz/funkce/elektronicka-kniha-jizd?gad=1&gclid=CjwKCAjwp8OpBhAFEiwAG7NaEtv_5M5m_w0kIFcoJ2FhajByzBRqAQhAaMwz79j_jqRGMVX71QCXCRoCLtIQAvD_BwE)  

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

6. **Detaily o vozidle**: Možnost zobrazit informace o jednotlivých vozidlech, včetně typu paliva, je pro uživatele důležitá.

7. **Poznámky a komunikace mezi uživateli**: Někteří uživatelé chtějí možnost přidávání poznámek nebo komunikace ohledně vozidel a jízd.

Tyto klíčové potřeby a problémy budou zohledněny při návrhu a vývoji naší aplikace, abychom poskytli uživatelům efektivní a uživatelsky přívětivé řešení pro správu knihy jízd a souvisejících úkolů.

## 6. Návrh aplikace - Rozdělení práce

Rozhodli jsme se pro 2. způsob - rozdělení částí aplikace do jednoho společného celku.

Rozdělení práce:
- xmikys03: menu pro výběr aut, editace a přidání aut
- xgabry01: základní komponenty, uživatel - registrace a výběr
- xbielg00: zapisování kilometrů a detaily s tím spojené

## 7. Návrh aplikace - Návrh makety

<figure style="margin: 0 auto;
        text-align: center;">
    <img src="https://lh3.googleusercontent.com/pw/ADCreHeAgy6y1hpDx8tBCtdwOjEs2PVKOZCRPdGMNl1tJew0mFvRI8_mkwtis6tetLhVEbJMF8Qk0D4r-nHc1R9soCC6gfzNRwkAMyTm36K9G39E1V8fXR9WxS69m90qAzvoH-oax2_YD6lI5T8Q9LNpNgna0kkz2vFxv4IuAomO_o0Tpc5Hmw7SzG0WewQPhWou8rLjU0ZAIm5Pxg3kGgi-_QBNEpXJVSTmPtpJvsuIutDjhF8-ioho50E-6BJJRn6VqvoMgNCbd2JxBKGHrV4SymW0GSMgswCNIX9TKuhTUKvK4l39kMSutHAFqRtdt-4Hllmw1DjOGruEa-YLfZlT396PttMwmQUQUQPNYVWFwZAo1dNHHcg-PNeb4E_f6tmRfJQSNRyReAbhzrmk-MsLgvOxfGj05CbMq1yGv34tm-ScPkVvqH6Lksm-i_B79oeFMcyO-fY35jHrlFj7r_k6sKGTjLdh9cvMrAPJyHB5zzdLsv4gJpLwn-NnYUrbTqallQDZv7zJzi0mjgnY35FYHzYRvWxuC2fp71IVtgBgy5qqIm86w2GCxp8RrR6XzeUVwpYE-Whx6ac2soHRtyKK8HYunCt3OMHC2i7xqVtwiuYGnHeeW-btsIYvL8yhtDczbuTngOM1a12-ERKKwtp0HJU-bIFVUutK407EqpXL1tsyifVE02kgwjCKhwzN7D16rhTZkWbma86JBcnDBK1HyuIezG3khgdg8IdIdpC2IHHLii5V_ZLru_Y9k8wQcafw9fSiIE3Rjf-bVEtvv_x4NGhVZn1BbLGLaGYZa-CmjHiWtT5O0yrSy4-P2n8TIFWYe-NLgom3gqcyf46vPoUyhlpB8eSwB_jXLpUxmGGSnWuvCvedLL2R4r2mXBHKBs6mWRtGO73wGpqNjxFprD0rp0zSStiKp26xukjcWlIRtyXFSDomkq0SBr_ZUUdsprvbxmGWvN4e9N6Ndkq9LYozXA6Iff7kIZvF6fXW66P9du0o5K9V3VNQm6FjEAk8crAcy8D5=w1147-h1225-s-no-gm?authuser=0"
        alt="Figma Mockup Overview">
    <figcaption>Přehled celkové namodelované makety</figcaption>
</figure>
<br>
<figure style="margin: 0 auto;
        text-align: center;">
    <img src="https://lh3.googleusercontent.com/pw/ADCreHciLT6rp_iSlUEO6OppucfPH6lVBVkdSy60RQQgWDkq6egJtPJ3hxaY21w7OsY-TgRkdEJyDnw5hZ-HqEdmIY-IRNtwnsT0rqbrUZGiPyECAJk2UWO67YAzw7Y06srNu_1OArNll5pKYKz9nrih8D0ypV1_NqV4krfSWLeMjk6oB9qaWd3uGpBTpGXWyhg0uvI73FUaolum8-G7eSTu5qdAVzNhSI4MsCGmD4rRn4RW0ldqI4-FPeLdhya43Y978HiJpu7067xVrbVaeL5OEQCbfHfofro-_lSF404kRkIkBILosRVTMFQO0T82A3B2X0XM55_SLQcpE9ypkErLFFOSOEdcReorOZPXKpCXfhfu9AP0MrQwTzu87syyX1ilXW1HozvqyedbWeMlp7jDGph_QccUROFHnJ35p1UOsBfkYg46ORGR8W-PNGyepyMwOifrZNykhsX4xCOXG3xm7Wn8ewFrRufXz6IzIDTKn57NZAqLkPhJeWVEGLYGq8vZk7VT_VWENsvbmGPpW-lIF47dYynFgYmPpiOIKVa7gr6UY6rvpoCHx1Kckz3NrbGfzJsP8do6Ksvu02foXF6GCaSEhPsFiLvyN5ZBykxpsbGO97p8zT9xNf_lklmOw-bZebND8ty0F4amRARzXefxs0R6DoBKuD5Tu22GQWgmruz4ZphYf6F0N-qs5GXCqrwxYc5MYysj4PJAKjzIgScF-RolYVpCU0wBUL6UhAtulin6hLZe3QRZn2nuoTwooxy85gXYhEo2K2N3VJ0tpK8KqiFhJFWFlVGb0AnC5HnHD4pXI45N6B4Wrkv90DSUdhVOLXMQbcZmB0Xqw-MMiMBulTG6Z-gtPudn-lDt0hBMUAdJzhoVk0QXdKvBY81nSEEQldzIn0MsWp44s4F5ikxPV4boWwfCnmVGn3KR9ID7ty8z8loO1TxiDJCxqzMI5vGPoS_-oakHP-eCD966kRte0s55AOvc6BXCIQydAblmBXmswxQG1_b1ZyUy3bKNLSGOxKQg=w393-h852-s-no-gm?authuser=0"
        alt="Figma Mockup Overview">
    <figcaption>Centrální evidence vozidel</figcaption>
</figure>

Uživatelé si přáli jednoduše vybrat jedno z firemních vozidel, k tomu jsme vytvořili i možnost přidat nová firemní auta.
<br>

<figure style="margin: 0 auto;
        text-align: center;">
    <img src="https://lh3.googleusercontent.com/pw/ADCreHdLuPRW--yJjAoRWQZUZV3vK4SpFB987sJz6EBZUiQYgeLHtz0xbJXX10fxxVtuJYO1hiDrcb48Rbp8wyPQ5V-ajyz7xGEJDFSmJ6burKnLyF8AYY2HhSRFp992iuWwTBqKg-rTMw72RzFGhP5YfcO6HJIsrQud4ycFmpZjDH5bugssV6stPuFG29Yqd6kmYQvzbx_EVpXg3zojezFLJsK9MuH6lLA6-52-dOdvInZafeQYZnhwlfhinrw1PAoQud5-YmmpP-6uamFGsq5uQ4_iNmtUnQmNBECQ_fWF8279J9dhLloPHYgKZyz2UWfB-e4fC4X9tXP4r_jAjwoHzAPxsFkI5stZUg49mmR79Xj0k-eDj0sZRvu7W8QMQTqgSS1p8HmjlaD4jb9bt8D_AofX0ajNOEISZZHFKsbsoLrRfVmK2ejJm8J51T6iGN0syZCBVDfBLLSHf_8nGo0g2iXfeOD6w0jDEN76wA2GqPIEP9jrt1RuLKA4BXJlHJ-npcXLCfspKN7Jl7AEqS5C9alde9Zil-AArIEr2TB61Con68fBCQdvdJpYMshgWdHE0Jbrw88XIrK1a9R-rZ6b73IohAuuKyvZ7qmmCccSaOvcvk-UheztZyAwLuRlnZCvB6Q3Fey2Wys76eQ-Mq6PxYVWM2zd1uReSxA5lk9vEqbGOs_ACKL3itdXpbTB4ltHDbUn9ZMF4JXLPx2UB82Dy7ZoZv4fQ32eGiQGWKOZzoMIU5XgxgpqKZM0x84A91MdZ9CzA4bNKxjcKHz5boiuSPlN-vITRH9mObTE5StkKCDSN1fAm--5JVeY_XVejMp2nhYBabWiuA2kKUHJ7Gt483OJ-w0fFpYD0dEc7fVsp3CKrZ3w9ayik5lwDgn4-YSjfuhPTLFFl2XHKKO4ahW8zMOT_Z8CjGpYE2M7vEQKI6ywqKxNp6rtALdbLIeZsP4bvdc3X79pKmkA-PjsQ_2Mr-JVbaVHsS0lh_0ql9Lmdt7jjyf0ntId4lRVVENEzOFDbNO0=w393-h852-s-no-gm?authuser=0"
        alt="Figma Start Ride">
    <figcaption>Karta pro začátek jízdy a rozcestník pro práci s knihou jízd po vybrání auta</figcaption>
</figure>

Náhledová stránka s přehledem stavu tachometru, detailu vozidla i možnost přidání poznámek/záznamů tankování.
<br>

<figure style="margin: 0 auto;
        text-align: center;">
    <img src="https://lh3.googleusercontent.com/pw/ADCreHdAfjzuPEVl9cfb7nknbbpPaqY_wJlUBTlXdA4gtVzk2FDqFxtAv4TjkGpYfOhXmpXCRBHPtxlQ4Tb8HYaMBg44J2NK27WiTXJ1Ch0l-_ITuqzXPOugp2V3HHLnrJOZRXdI3JrEx3EfRfWQMRo-Oe_YPMlhdMySYgamQtv-wAB2yNXluNUaiPkuArVUtgyHUF6RtEJu1l28GvC9wycEGeiCmcjxTwNzTLK-MiXpnVJnOUK1fblK3l_MHbPugd1b3jDZsFiqnZFCuPK_fSgoCMskP2JNOWfxlif9DQfM03THro3Zvm-MAAL0By3gbbgLDNakzWpclcRrK_ZUt_sQoabhU0ojUvEDb5FFcl7uj_BWw3B2lhubTbNy0if2sxukRNv9cNdUH3BJwU15Bi3y--PWFK1lltJt48QJg3sXLMRCuAwVpo2G62uYW5BVYQz31y2hjv1LyV5dZxY9BBR7f7mUPFOrtrs3RtIOxnbGbTuJsNtEFWLJ28MywVKcLsp8B4B9xmQ9J6XLHDrbOZiv13NklXbBTAayPLJNL7Syt8XCj30fsfRSOuPyNPGg8f6gjx8E0SX7Ag5nrkJa9vkU5DrW2vmmo_mTrurQEs4cY-X7kQAIcIYx1oc5ET1l4UKh8ZyZLTcOS2NLXEORn-aeVm-OZEnjsAPsRYW3B3vvcIZBeXOD-gO9cPgMosMmkQAARlvDyVCuHoMndHXJhF_k468V9OVGegLZyPxt8isATM5h3wsfwnSU40WKAAGnUNZMk0LI4u7W3Yw2y0kjSR2iAoZQq6XISnrxGy4-_MiunR-QfjLaF8BqIzotrVrY52uc_XbZvQTzmFD_WXz3ceeIgySmH1gZVJNiABRJi6HQSWdw9z48iSqj0vf4w3TwUb9QAWXnHxgxJ9ZsEyIypT7mVw_sIbUMlfiWcR4mP_GLKS_MVTLzzepym8SQ099kJDIv15-Lzi1_DvYvQBzljCZBEpwLDVB36DWJWLV4Y-zMOuJPTfVV85TYlXD1o7VMvzRIFR8F=w393-h852-s-no-gm?authuser=0"
        alt="Figma Finish Ride">
    <figcaption>Stav po započetí jízdy</figcaption>
</figure>

Potom co začneme jízdu se nám zobrazí následující obrazovka, kde pro dokončení jízdy zadáme údaj z tachometru a stiskneme tlačítko "FINISH DRIVE".
<br>

<figure style="margin: 0 auto;
        text-align: center;">
    <img src="https://lh3.googleusercontent.com/pw/ADCreHem5mWm1bVh0xlODi6lJqydWF1ZiYsifZS39CNoolQDE5gSf6w0YlCCtQV5o2XzpdomoYfPVpo91Q2NfAT7m_gO_lC61GDRmjZA3Ud81IVTpLV7xFIdzX9jLcNaAuyMvXU7qwqeIJwXA9GNZc5QcrZQq7rs0-Etdr6I30W8bBZR5hqSPr5wn4kVBf_D3cBtvYHNY77Sw9dtcvShnyeBk5NQ0Sqsff96kHv9Sl3YZdC0uyTvJOmazcWxCTS1vBvBy8rUr_l1p3kVZ8YxH7VRSnoPh2yBnYaLDoM0O6XHlestKvyh3b3DQ1QwOK_bzM84IejfMaish6T0Q_3Ox4npEne5_mo83ZoDq1dklPvtDPBaZdzlyhBjtHujhFymhaJK2Id6zlTs8JtV9qIeKpp8cwPtHS0nOZb_7u59KzJzNEd4oOvC1obTOVK1ajXlIj2iQqDpGN1D3JKMhDDp6vTXKX0XMeXaH32OQFqw_am7YN_VcGEwiDLKqa9ATILWg9IdjRlBQk0quVUkuKM_vWoyqaDGJ5M2-Q3b4HcOdUgFcKULE1IeE9iVlPEu6-Z4HPrOjaIBUgvJ6SX01vyc8AG4vNoans2X0AoavAJVEoj8hpWokZ0trLZbF1Nq-IgnznpNHdvq5eyRNIr8Bk55Wkd9whwDiCoER3OSoXYz8k6sDsVl-KBzngteSgnef_evZAhGgd7Tpj_IYPVXMaMpcyoYwX8wVnADstdHMN-aQRJyb4PR-1HmnXpAQtt0k7_7RAO3sWjUhEDmfce5o8X757DcmPIEBBgSw7-VvsPWjW5GXHTmmQGUi-3my7qIb5aKz30MITDpm9SEjquQGnDz-lr3BWP8lueS32Ydgu9Sbrle7hAX5PxDFSAuvbg7C9-RBNPJly2zWAsy_jSNVvreJoAlmLBfAUyaIvv07YboxZHOblJ543GielyOWWxruPA4z2QrlCuXYze6J89xL944Dx3hcLBK9xc5xHdvjtnz6OMvjz1k7qAca8Y5Q4WbKVnOoLy5KkbK=w401-h860-s-no-gm?authuser=0"
        alt="Figma Finished Ride Result">
    <figcaption>Souhrn po dokončení jízdy</figcaption>
</figure>
Zobrazení počtu ujetých kilometrů společně se záměrem a destinací jízdy + zobrazení tlačítka s informacemi o asistenční službě

## 8. Návrh aplikace - Testování

Uživatelům, kterým bylo umožněněno testovat náš návrh aplikace byla zpřístupněna funkční maketa ve webové aplikaci Figma.

Nedostatky odhalené při používání se vyskytly v následujícíh scénářích:
- **Nemožnost se vrátit o krok zpět**
    - Častá nespokojenost směřovala k nemožnosti vrátit se zpátky, uživatelé se zaseknuli a nevěděli, jak v programu pokračovat, v tomto ohledu budeme muset doimplementovat možnost nějaké zpětné šipky pro vrácení se o krok dozadu, je možné implementovat i z hlediska gesta (potáhnutí doprava, jak jsou standartně novodové OS telefonů tvořeny)
- **Hláška o provedení akce**
    - Připomínka od uživatele David Š. směřovala na nedostatek/až absenci chybových a úspěšných hlášek, podle testera bylo dobře zvolené červené podbarvení tlačítka v chybovém stavu, ale navíc by si přál získat i text s konkrétní chybou, to stejné pro úspěch např. vytvoření/smazaní uživatele nám bude doprovázet hláška o úspěchu
- **Design Input Fields**
    - Uživatel Michal A. (FE vývojář) namítl, že mu nepřijde zřejmé jaké pole jsou možné editovat v kartě detailu uživatele, bylo by tedy dobré v implementované verzi tuto designovou chybku ošetřit, ať je opravdu zřejmé.
    
Testeři: Michal B., David Š., Jan K., Patrik Š., Michal A. (bližší informace o uživatelech poskytnuty v sekci pro dotazníky)

## 9. Technické řešení + technologie

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
   - **Firebase Realtime Database (Databáze)**: Použijeme Firebase Realtime Database jako databázi pro ukládání uživatelských dat, jízd, výdajů a poznámek. Ta nám poskytuje snadnou synchronizaci dat mezi FE a BE.
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