local unpack = string.unpack
local orastrainers = {
	"ツチバミ", "クワミズ", "オトガナ", "カシノミネ", "ロクロ", "ヨヘイ",
	"ワカタケ", "ツバル", "カミノゲ", "ミソウズ", "オギリハタ", "カチユキ",
	"ショウジン", "ショウノスケ", "ミニミ", "ミニエ", "ハルベルト", "ヨタロウ",
	"ビンロウ", "チヅカ", "ミツナリ", "カタツネ", "エンガワ", "コハダ", "チヂ",
	"キモツキ", "コチンダ", "ガネコ", "カバオ", "ゲンゴロウ", "ディディエ",
	"マチルド", "ウルミ", "ルンナ", "アイアイ", "ラクヤ", "ロッカク",
	"テッシン", "ユーラリア", "アガタ", "ジャンヌ", "ボブジロウ", "ボブノスケ",
	"ボブベエ", "マサ", "マルカミ", "テンジク", "テツ", "ニッケイ",
	"サビアサギ", "シャンク", "アイアン", "ボギー", "シッコク", "マソボ",
	"カリヤス", "アントク", "トキヒト", "ユキムラ", "ウジマサ", "カブリオ",
	"ミラジーノ", "セリカ", "アコード", "ファブリス", "フロリアン", "カロル",
	"リュシル", "パリエ", "パリミ", "マティス", "ルルー", "タイジン", "ウサギ",
	"ウォンポー", "タイクーシン", "カイタック", "スタンレー", "シャーティン",
	"リャンガン", "ダニイル", "フョードル", "マキエ", "ウルシ", "モリリン",
	"ミズノスケ", "ウソブキ", "オタフク", "ギャル", "マレマレ", "エーオース",
	"ヘーメラー", "ヤブサメ", "ウツケ", "フトコロ", "ロッテ", "テレーゼ",
	"ツヤコ", "ボルドバト", "ソロンゴ", "ハーン", "ジャッキィ", "ヘンリィ",
	"マムー", "ウンスー", "ハリマオ", "エンピ", "テンホウ", "チーホウ",
	"スーカンツ", "ススタケ", "マウス", "カメノゾキ", "テラコッタ", "バフ",
	"ボルドー", "マツウシ", "ツルマツ", "サエモン", "グエン", "ムーイ",
	"パーム", "ポンタ", "ドンタ", "マゴベエ", "シンマル", "ヤマウバ",
	"シンジャ", "ナマナリ", "ハンニャ", "セドリック", "シモン", "ヘイズ",
	"ミスティ", "ハイサム", "コンニョン", "ハマチ", "イクラ", "ジョルジュ",
	"サミュエル", "アンコ", "ソップ", "ベゾルブ", "マリィー", "ナンゼン",
	"フドウ", "ワルエ", "ワルミ", "ブリキチ", "ブリノリ", "ダイアズマ",
	"ガッツマン", "アム", "ニコル", "ヘチカン", "リキュウ", "カラスバ",
	"ロクショウ", "ロマン", "バレリー", "コレチカ", "ノリカタ", "スボシ",
	"トミテ", "エキエ", "チリコ", "エチエンヌ", "マクシム", "オディール",
	"ジゼール", "カルロスベエ", "ワン", "ミリ", "ナチ", "コトリ", "ヒヨコ",
	"ジッカンジ", "トミグスク", "アガリヤマ", "オドンジキ", "マンタロウ",
	"チョウジロウ", "センコ", "ジュウ", "カミュ", "リルケ", "モユ", "ルイカ",
	"カンノン", "ニグラウス", "サナ", "ティエルノ", "トロバ", "カルム",
	"セレナ", "ラニュイ", "ルスワール", "ラジュルネ", "ルミタン", "ラニュイ",
	"ルミタン", "ラジュルネ", "ラニュイ", "でし", "ともだち", "なかま",
	"しんゆう", "でし", "ともだち", "なかま", "しんゆう", "ユウキ", "ハルカ",
	"ミツル", "アオギリ", "マツブサ", "ダイゴ",
}
local jtrainers = {
	"テルモト", "カネツグ", "ユイットル", "パンタード", "フリッツ", "ヨヘイ",
	"ワカタケ", "ツバル", "カイン", "アベル", "ポワソン", "ユイトール",
	"ユーセフ", "ザイド", "ベティ", "ヘレナ", "クンヤ", "シャムス", "ビンロウ",
	"チヅカ", "レオナルト", "ローレンツ", "エンガワ", "コハダ", "セルジオ",
	"フェリペ", "ビージャル", "メリル", "タピオカ", "ゲンゴロウ", "ディディエ",
	"マチルド", "ウルミ", "ルンナ", "アイアイ", "オベロン", "トリトン",
	"カロン", "ユーラリア", "アガタ", "ジャンヌ", "ボブジロウ", "ボブノスケ",
	"ボブベエ", "マサ", "マルカミ", "テンジク", "テツ", "ニッケイ",
	"サビアサギ", "シャンク", "アイアン", "ボギー", "シッコク", "マソボ",
	"カリヤス", "アントク", "トキヒト", "ユキムラ", "ウジマサ", "カブリオ",
	"ミラジーノ", "セリカ", "アコード", "ファブリス", "フロリアン", "カロル",
	"リュシル", "パリエ", "パリミ", "マティス", "ルルー", "アンゴラ",
	"パローデル", "ウォンポー", "タイクーシン", "カイタック", "スタンレー",
	"シャーティン", "リャンガン", "ダニイル", "フョードル", "マキエ", "ウルシ",
	"モリリン", "ミズノスケ", "ウソブキ", "オタフク", "ギャル", "マレマレ",
	"エーオース", "ヘーメラー", "ヤブサメ", "ウツケ", "フトコロ", "ロッテ",
	"テレーゼ", "ツヤコ", "ボルドバト", "ソロンゴ", "ハーン", "ジャッキィ",
	"ヘンリィ", "マムー", "ウンスー", "ハリマオ", "エンピ", "テンホウ",
	"チーホウ", "スーカンツ", "ススタケ", "マウス", "カメノゾキ", "テラコッタ",
	"バフ", "ボルドー", "マツウシ", "ツルマツ", "サエモン", "グエン", "ムーイ",
	"パーム", "ポンタ", "ドンタ", "マゴベエ", "シンマル", "ヤマウバ",
	"シンジャ", "ナマナリ", "ハンニャ", "セドリック", "シモン", "ヘイズ",
	"ミスティ", "ハイサム", "コンニョン", "ハマチ", "イクラ", "ジョルジュ",
	"サミュエル", "アンコ", "ソップ", "ベゾルブ", "マリィー", "ガニメデ",
	"プロテウス", "リリアン", "モニック", "パリノシン", "パリヘイタ",
	"ダイアズマ", "ガッツマン", "アンギーユ", "フェザン", "ヘチカン",
	"リキュウ", "カラスバ", "ロクショウ", "ロマン", "バレリー", "コレチカ",
	"ノリカタ", "スボシ", "トミテ", "エキエ", "チリコ", "エチエンヌ",
	"マクシム", "オディール", "ジゼール", "カルロス", "アンドレイ", "クラベス",
	"カバサ", "パリコ", "パリリ", "ジッカンジ", "トミグスク", "アガリヤマ",
	"オドンジキ", "マンゾウ", "イエオン", "ショウ", "ツヅミ", "カミュ",
	"リルケ", "サティー", "アパルナ", "カンノン", "ニグラウス", "サナ",
	"ティエルノ", "トロバ", "カルム", "セレナ", "ラニュイ", "ルスワール",
	"ラジュルネ", "ルミタン", "ラジュルネ", "ルスワール", "ルスワール",
	"ルミタン", "サナ", "ティエルノ", "トロバ", "カルム", "セレナ", "ラニュイ",
	"ルスワール", "ラジュルネ", "ルミタン", "ラニュイ", "ルミタン",
	"ラジュルネ", "ラニュイ",
}
local sets = {
	"Set 1 Normal/Bug", "Set 1 Normal/Bug", "Set 1 Normal/Fairy",
	"Set 1 Normal/Fairy", "Set 1 “B (Old)”", "Set 1 “A (New)”",
	"Set 1 “B (Old)”", "Set 1 “A (New)”", "Set 1 “B (Old)”", "Set 1 “A (New)”",
	"Set 1 “B (Old)”", "Set 1 “A (New)”", "Set 1 “B (Old)”", "Set 1 “A (New)”",
	"Set 1 “B (Old)”", "Set 1 “A (New)”", "Set 1 “B (Old)”", "Set 1 “A (New)”",
	"Set 1 “B (Old)”", "Set 1 “A (New)”", "Set 1 “B (Old)”", "Set 1 “A (New)”",
	"Set 1 “B (Old)”", "Set 1 “A (New)”", "Set 1 “B (Old)”", "Set 1 “A (New)”",
	"Set 1 “B (Old)”", "Set 1 “A (New)”", "Set 1 Ground/Rock/Steel",
	"Set 1 Ground/Rock/Steel", "Set 1 “B (Old)”", "Set 1 “A (New)”",
	"Set 1 Normal/Psychic/Fairy", "Set 1 Normal/Psychic/Fairy",
	"Set 1 Normal/Psychic/Fairy", "Set 1 Poison/Fire/Dark",
	"Set 1 Poison/Fire/Dark", "Set 1 Poison/Fire/Dark",
	"Set 1 Poison/Fire/Dark", "Set 1 Poison/Fire/Dark",
	"Set 1 Poison/Fire/Dark", "Set 1 Fire/Water/Grass",
	"Set 1 Fire/Water/Grass", "Set 1 Fire/Water/Grass", "Set 1 “B (Old)”",
	"Set 1 “A (New)”", "Set 1 “C”", "Set 1 “B (Old)”", "Set 1 “A (New)”",
	"Set 1 “C”", "Set 2 “B (Old)”", "Set 2 “A (New)”", "Set 2 “C”",
	"Set 2 “B (Old)”", "Set 2 “A (New)”", "Set 2 “C”",
	"Set 2 Ground/Rock/Steel", "Set 2 Ground/Rock/Steel",
	"Set 2 Ground/Rock/Steel", "Set 2 Ground/Rock/Steel",
	"Set 2 Flying/Electric & Empoleon", "Set 2 Flying/Electric & Empoleon",
	"Set 2 Flying/Electric & Empoleon", "Set 2 Flying/Electric & Empoleon",
	"Set 2 “B (Old)”", "Set 2 “A (New)”", "Set 2 “B (Old)”", "Set 2 “A (New)”",
	"Set 2 Normal/Dark/Fairy", "Set 2 Normal/Dark/Fairy",
	"Set 3 Ground/Bug/Grass", "Set 3 Ground/Bug/Grass", "Set 3 Water/Ice",
	"Set 3 Water/Ice", "Set 3 “B (Old)”", "Set 3 “A (New)”", "Set 3 “C”",
	"Set 3 “B (Old)”", "Set 3 “A (New)”", "Set 3 “C”", "Set 3 “B (Old)”",
	"Set 3 “A (New)”", "Set 3 “B (Old)”", "Set 3 “A (New)”", "Set 3 “B (Old)”",
	"Set 3 “A (New)”", "Set 3 “B (Old)”", "Set 3 “A (New)”", "Set 3 Eevee",
	"Set 3 Eevee", "Set 4 “B (Old)”", "Set 4 “A (New)”",
	"Set 4 Poison/Electric & Fossil", "Set 4 Poison/Electric & Fossil",
	"Set 4 Poison/Electric & Fossil", "Set 4 Poison/Electric & Fossil",
	"Set 4 Poison/Electric & Fossil", "Set 4 Poison/Electric & Fossil",
	"Set 4 Ghost/Psychic", "Set 4 Ghost/Psychic", "Set 4 Ghost/Psychic",
	"Set 4 Ghost/Psychic", "Set 4 Ghost/Psychic", "Set 4 Ghost/Psychic",
	"Set 4 Fight/Rock/Fire", "Set 4 Fight/Rock/Fire", "Set 4 Fight/Rock/Fire",
	"Set 4 Fight/Rock/Fire", "Set 4 Fight/Rock/Fire", "Set 4 Fight/Rock/Fire",
	"Set 4 Ground/Water/Grass", "Set 4 Ground/Water/Grass",
	"Set 4 Ground/Water/Grass", "Set 4 Ground/Water/Grass",
	"Set 4 Ground/Water/Grass", "Set 4 Ground/Water/Grass",
	"Set 4 “B (Old)” & Latios12", "Set 4 “A (New)” & Latios12",
	"Set 4 “Mixed” & Latios12", "Set 4 “B (Old)” & Latias12",
	"Set 4 “A (New)” & Latias12", "Set 4 “Mixed” & Latias12", "Set 1/2 Legend",
	"Set 1/2 Legend", "Set 1/2 Legend", "Set 1/2 Legend", "Set 1/2 Legend",
	"Set 1/2 Legend", "Set 1/2 Legend", "Set 1/2 Legend", "Set 4 “B (Old)”",
	"Set 4 “A (New)”", "Set 4 “B (Old)”", "Set 4 “A (New)”", "Set 4 “B (Old)”",
	"Set 4 “A (New)”", "Set 4 “B (Old)”", "Set 4 “A (New)”",
	"Set 4 Fight/Ground/Rock", "Set 4 Fight/Ground/Rock", "Any SpA & Latios",
	"Any SpD & Latias", "Set 3/4 Ghost/Psychic", "Any Trick Room",
	"Set 4 Poison/Fire/Dark", "Any Intimidate", "Set 4 Poison/Fire/Dark",
	"Set 4 Poison/Fire/Dark", "Set 4 Fire/Water/Grass", "Any Sun",
	"Set 4 “B (Old)”", "Set 4 “A (New)”", "Set 4 “B (Old)”", "Set 4 “A (New)”",
	"Set 4 “B (Old)”", "Set 4 “A (New)”",
	"Set 4 Ground/Rock/Steel & Regirock12", "Set 4 “B (Old)”",
	"Set 4 Ground/Rock/Steel", "Any Sand", "Set 4 Ground/Rock/Steel",
	"Set 4 Ground/Rock/Steel", "Set 3/4 Flying/Electric",
	"Set 3/4 Flying/Electric", "Set 3/4 Flying/Electric",
	"Set 3/4 Flying/Electric", "Set 3/4 Legend", "Any Legend", "Set 3/4 Legend",
	"Any Legend", "Set 4 Water/Ice", "Any Hail & Meganium2", "Set 4 Water/Ice",
	"Any Rain", "Set 4 Normal/Dark/Fairy", "Set 4 Normal/Dark/Fairy",
	"Set 4 “B (Old)”", "Set 4 “A (New)”", "Set 4 “B (Old)”", "Set 4 “A (New)”",
	"Set 4 “B (Old)”", "Any Starter", "Set 4 “B (Old)”", "Any Starter",
	"Set 4 “B (Old)”", "Set 4 “A (New)”", "Set 4 “B (Old)”", "Set 4 “A (New)”",
	"Any Eevee", "Any Eevee", "Set 1/2 Sylveon1, Goodra2",
	"Hawlucha1, Talonflame4", "Tyrantrum2, Aurorus3",
	"Set 3/4 Chesnaught3, Delphox4, Greninja4",
	"Set 3/4 Chesnaught3, Delphox4, Greninja4",
	"Tornadus2, Landorus2, Thundurus3", "Latios1, Raikou3, Entei4, Suicune4",
	"Any Moltres1, Registeel2, Articuno3, Zapdos3, Regirock3, Regice4",
	"Latias1, Cobalion2, Terrakion3, Virizion3",
	"Tornadus2, Landorus2, Thundurus3",
	"Latias1, Cobalion2, Terrakion3, Virizion3",
	"Any Moltres1, Registeel2, Articuno3, Zapdos3, Regirock3, Regice4",
	"Tornadus2, Landorus2, Thundurus3",
}
local names = {
	"Bulbasaur", "Ivysaur", "Venusaur", "Charmander", "Charmeleon", "Charizard",
	"Squirtle", "Wartortle", "Blastoise", "Caterpie", "Metapod", "Butterfree",
	"Weedle", "Kakuna", "Beedrill", "Pidgey", "Pidgeotto", "Pidgeot", "Rattata",
	"Raticate", "Spearow", "Fearow", "Ekans", "Arbok", "Pikachu", "Raichu",
	"Sandshrew", "Sandslash", "Nidoran♀", "Nidorina", "Nidoqueen", "Nidoran♂",
	"Nidorino", "Nidoking", "Clefairy", "Clefable", "Vulpix", "Ninetales",
	"Jigglypuff", "Wigglytuff", "Zubat", "Golbat", "Oddish", "Gloom",
	"Vileplume", "Paras", "Parasect", "Venonat", "Venomoth", "Diglett",
	"Dugtrio", "Meowth", "Persian", "Psyduck", "Golduck", "Mankey", "Primeape",
	"Growlithe", "Arcanine", "Poliwag", "Poliwhirl", "Poliwrath", "Abra",
	"Kadabra", "Alakazam", "Machop", "Machoke", "Machamp", "Bellsprout",
	"Weepinbell", "Victreebel", "Tentacool", "Tentacruel", "Geodude",
	"Graveler", "Golem", "Ponyta", "Rapidash", "Slowpoke", "Slowbro",
	"Magnemite", "Magneton", "Farfetch’d", "Doduo", "Dodrio", "Seel", "Dewgong",
	"Grimer", "Muk", "Shellder", "Cloyster", "Gastly", "Haunter", "Gengar",
	"Onix", "Drowzee", "Hypno", "Krabby", "Kingler", "Voltorb", "Electrode",
	"Exeggcute", "Exeggutor", "Cubone", "Marowak", "Hitmonlee", "Hitmonchan",
	"Lickitung", "Koffing", "Weezing", "Rhyhorn", "Rhydon", "Chansey",
	"Tangela", "Kangaskhan", "Horsea", "Seadra", "Goldeen", "Seaking", "Staryu",
	"Starmie", "Mr.Mime", "Scyther", "Jynx", "Electabuzz", "Magmar", "Pinsir",
	"Tauros", "Magikarp", "Gyarados", "Lapras", "Ditto", "Eevee", "Vaporeon",
	"Jolteon", "Flareon", "Porygon", "Omanyte", "Omastar", "Kabuto", "Kabutops",
	"Aerodactyl", "Snorlax", "Articuno", "Zapdos", "Moltres", "Dratini",
	"Dragonair", "Dragonite", "Mewtwo", "Mew", "Chikorita", "Bayleef",
	"Meganium", "Cyndaquil", "Quilava", "Typhlosion", "Totodile", "Croconaw",
	"Feraligatr", "Sentret", "Furret", "Hoothoot", "Noctowl", "Ledyba",
	"Ledian", "Spinarak", "Ariados", "Crobat", "Chinchou", "Lanturn", "Pichu",
	"Cleffa", "Igglybuff", "Togepi", "Togetic", "Natu", "Xatu", "Mareep",
	"Flaaffy", "Ampharos", "Bellossom", "Marill", "Azumarill", "Sudowoodo",
	"Politoed", "Hoppip", "Skiploom", "Jumpluff", "Aipom", "Sunkern",
	"Sunflora", "Yanma", "Wooper", "Quagsire", "Espeon", "Umbreon", "Murkrow",
	"Slowking", "Misdreavus", "Unown", "Wobbuffet", "Girafarig", "Pineco",
	"Forretress", "Dunsparce", "Gligar", "Steelix", "Snubbull", "Granbull",
	"Qwilfish", "Scizor", "Shuckle", "Heracross", "Sneasel", "Teddiursa",
	"Ursaring", "Slugma", "Magcargo", "Swinub", "Piloswine", "Corsola",
	"Remoraid", "Octillery", "Delibird", "Mantine", "Skarmory", "Houndour",
	"Houndoom", "Kingdra", "Phanpy", "Donphan", "Porygon2", "Stantler",
	"Smeargle", "Tyrogue", "Hitmontop", "Smoochum", "Elekid", "Magby",
	"Miltank", "Blissey", "Raikou", "Entei", "Suicune", "Larvitar", "Pupitar",
	"Tyranitar", "Lugia", "HoOh", "Celebi", "Treecko", "Grovyle", "Sceptile",
	"Torchic", "Combusken", "Blaziken", "Mudkip", "Marshtomp", "Swampert",
	"Poochyena", "Mightyena", "Zigzagoon", "Linoone", "Wurmple", "Silcoon",
	"Beautifly", "Cascoon", "Dustox", "Lotad", "Lombre", "Ludicolo", "Seedot",
	"Nuzleaf", "Shiftry", "Taillow", "Swellow", "Wingull", "Pelipper", "Ralts",
	"Kirlia", "Gardevoir", "Surskit", "Masquerain", "Shroomish", "Breloom",
	"Slakoth", "Vigoroth", "Slaking", "Nincada", "Ninjask", "Shedinja",
	"Whismur", "Loudred", "Exploud", "Makuhita", "Hariyama", "Azurill",
	"Nosepass", "Skitty", "Delcatty", "Sableye", "Mawile", "Aron", "Lairon",
	"Aggron", "Meditite", "Medicham", "Electrike", "Manectric", "Plusle",
	"Minun", "Volbeat", "Illumise", "Roselia", "Gulpin", "Swalot", "Carvanha",
	"Sharpedo", "Wailmer", "Wailord", "Numel", "Camerupt", "Torkoal", "Spoink",
	"Grumpig", "Spinda", "Trapinch", "Vibrava", "Flygon", "Cacnea", "Cacturne",
	"Swablu", "Altaria", "Zangoose", "Seviper", "Lunatone", "Solrock",
	"Barboach", "Whiscash", "Corphish", "Crawdaunt", "Baltoy", "Claydol",
	"Lileep", "Cradily", "Anorith", "Armaldo", "Feebas", "Milotic", "Castform",
	"Kecleon", "Shuppet", "Banette", "Duskull", "Dusclops", "Tropius",
	"Chimecho", "Absol", "Wynaut", "Snorunt", "Glalie", "Spheal", "Sealeo",
	"Walrein", "Clamperl", "Huntail", "Gorebyss", "Relicanth", "Luvdisc",
	"Bagon", "Shelgon", "Salamence", "Beldum", "Metang", "Metagross",
	"Regirock", "Regice", "Registeel", "Latias", "Latios", "Kyogre", "Groudon",
	"Rayquaza", "Jirachi", "Deoxys", "Turtwig", "Grotle", "Torterra",
	"Chimchar", "Monferno", "Infernape", "Piplup", "Prinplup", "Empoleon",
	"Starly", "Staravia", "Staraptor", "Bidoof", "Bibarel", "Kricketot",
	"Kricketune", "Shinx", "Luxio", "Luxray", "Budew", "Roserade", "Cranidos",
	"Rampardos", "Shieldon", "Bastiodon", "Burmy", "Wormadam", "Mothim",
	"Combee", "Vespiquen", "Pachirisu", "Buizel", "Floatzel", "Cherubi",
	"Cherrim", "Shellos", "Gastrodon", "Ambipom", "Drifloon", "Drifblim",
	"Buneary", "Lopunny", "Mismagius", "Honchkrow", "Glameow", "Purugly",
	"Chingling", "Stunky", "Skuntank", "Bronzor", "Bronzong", "Bonsly",
	"MimeJr.", "Happiny", "Chatot", "Spiritomb", "Gible", "Gabite", "Garchomp",
	"Munchlax", "Riolu", "Lucario", "Hippopotas", "Hippowdon", "Skorupi",
	"Drapion", "Croagunk", "Toxicroak", "Carnivine", "Finneon", "Lumineon",
	"Mantyke", "Snover", "Abomasnow", "Weavile", "Magnezone", "Lickilicky",
	"Rhyperior", "Tangrowth", "Electivire", "Magmortar", "Togekiss", "Yanmega",
	"Leafeon", "Glaceon", "Gliscor", "Mamoswine", "PorygonZ", "Gallade",
	"Probopass", "Dusknoir", "Froslass", "Rotom", "Uxie", "Mesprit", "Azelf",
	"Dialga", "Palkia", "Heatran", "Regigigas", "Giratina", "Cresselia",
	"Phione", "Manaphy", "Darkrai", "Shaymin", "Arceus", "Victini", "Snivy",
	"Servine", "Serperior", "Tepig", "Pignite", "Emboar", "Oshawott", "Dewott",
	"Samurott", "Patrat", "Watchog", "Lillipup", "Herdier", "Stoutland",
	"Purrloin", "Liepard", "Pansage", "Simisage", "Pansear", "Simisear",
	"Panpour", "Simipour", "Munna", "Musharna", "Pidove", "Tranquill",
	"Unfezant", "Blitzle", "Zebstrika", "Roggenrola", "Boldore", "Gigalith",
	"Woobat", "Swoobat", "Drilbur", "Excadrill", "Audino", "Timburr", "Gurdurr",
	"Conkeldurr", "Tympole", "Palpitoad", "Seismitoad", "Throh", "Sawk",
	"Sewaddle", "Swadloon", "Leavanny", "Venipede", "Whirlipede", "Scolipede",
	"Cottonee", "Whimsicott", "Petilil", "Lilligant", "Basculin", "Sandile",
	"Krokorok", "Krookodile", "Darumaka", "Darmanitan", "Maractus", "Dwebble",
	"Crustle", "Scraggy", "Scrafty", "Sigilyph", "Yamask", "Cofagrigus",
	"Tirtouga", "Carracosta", "Archen", "Archeops", "Trubbish", "Garbodor",
	"Zorua", "Zoroark", "Minccino", "Cinccino", "Gothita", "Gothorita",
	"Gothitelle", "Solosis", "Duosion", "Reuniclus", "Ducklett", "Swanna",
	"Vanillite", "Vanillish", "Vanilluxe", "Deerling", "Sawsbuck", "Emolga",
	"Karrablast", "Escavalier", "Foongus", "Amoonguss", "Frillish", "Jellicent",
	"Alomomola", "Joltik", "Galvantula", "Ferroseed", "Ferrothorn", "Klink",
	"Klang", "Klinklang", "Tynamo", "Eelektrik", "Eelektross", "Elgyem",
	"Beheeyem", "Litwick", "Lampent", "Chandelure", "Axew", "Fraxure",
	"Haxorus", "Cubchoo", "Beartic", "Cryogonal", "Shelmet", "Accelgor",
	"Stunfisk", "Mienfoo", "Mienshao", "Druddigon", "Golett", "Golurk",
	"Pawniard", "Bisharp", "Bouffalant", "Rufflet", "Braviary", "Vullaby",
	"Mandibuzz", "Heatmor", "Durant", "Deino", "Zweilous", "Hydreigon",
	"Larvesta", "Volcarona", "Cobalion", "Terrakion", "Virizion", "Tornadus",
	"Thundurus", "Reshiram", "Zekrom", "Landorus", "Kyurem", "Keldeo",
	"Meloetta", "Genesect", "Chespin", "Quilladin", "Chesnaught", "Fennekin",
	"Braixen", "Delphox", "Froakie", "Frogadier", "Greninja", "Bunnelby",
	"Diggersby", "Fletchling", "Fletchinder", "Talonflame", "Scatterbug",
	"Spewpa", "Vivillon", "Litleo", "Pyroar", "Flabébé", "Floette", "Florges",
	"Skiddo", "Gogoat", "Pancham", "Pangoro", "Furfrou", "Espurr", "Meowstic",
	"Honedge", "Doublade", "Aegislash", "Spritzee", "Aromatisse", "Swirlix",
	"Slurpuff", "Inkay", "Malamar", "Binacle", "Barbaracle", "Skrelp",
	"Dragalge", "Clauncher", "Clawitzer", "Helioptile", "Heliolisk", "Tyrunt",
	"Tyrantrum", "Amaura", "Aurorus", "Sylveon", "Hawlucha", "Dedenne",
	"Carbink", "Goomy", "Sliggoo", "Goodra", "Klefki", "Phantump", "Trevenant",
	"Pumpkaboo", "Gourgeist", "Bergmite", "Avalugg", "Noibat", "Noivern",
	"Xerneas", "Yveltal", "Zygarde", "Diancie", "Hoopa", "Volcanion",
}
local natures = {
	"Hardy", "Lonely", "Brave", "Adamant", "Naughty", "Bold", "Docile",
	"Relaxed", "Impish", "Lax", "Timid", "Hasty", "Serious", "Jolly", "Naive",
	"Modest", "Mild", "Quiet", "Bashful", "Rash", "Calm", "Gentle", "Sassy",
	"Careful", "Quirky"
}
local items = {
	[149]="CheriB", [150]="ChestoB", [156]="PersimB", [157]="LumB",
	[158]="SitrusB", [184]="OccaB", [185]="PasshoB", [186]="WacanB",
	[188]="YacheB", [189]="ChopleB", [190]="KebiaB", [191]="ShucaB",
	[192]="CobaB", [193]="PayapaB", [194]="TangaB", [195]="ChartiB",
	[196]="KasibB", [197]="HabanB", [198]="ColburB", [199]="BabiriB",
	[201]="LiechiB", [202]="GanlonB", [203]="SalacB", [204]="PetayaB",
	[205]="ApicotB", [208]="EnigmaB", [210]="CustapB", [211]="JabocaB",
	[213]="BrightPowder", [214]="WhiteHerb", [217]="QuickClaw",
	[220]="ChoiceBand", [221]="KingsRock", [230]="FocusBand", [232]="ScopeLens",
	[234]="Leftovers", [237]="SoftSand", [238]="HardStone", [239]="MiracleSeed",
	[240]="BlackGlasses", [242]="Magnet", [243]="MysticWater",
	[246]="NeverMeltIce", [247]="SpellTag", [248]="TwistedSpoon",
	[249]="Charcoal", [250]="DragonFang", [255]="LaxIncense", [258]="ThickClub",
	[265]="WideLens", [266]="MuscleBand", [267]="WiseGlasses",
	[268]="ExpertBelt", [269]="LightClay", [270]="LifeOrb", [271]="PowerHerb",
	[272]="ToxicOrb", [273]="FlameOrb", [275]="FocusSash", [276]="ZoomLens",
	[277]="Metronome", [278]="IronBall", [281]="BlackSludge", [282]="IcyRock",
	[283]="SmoothRock", [284]="HeatRock", [285]="DampRock", [287]="ChoiceScarf",
	[296]="BigRoot", [297]="ChoiceSpecs", [299]="SplashPlate",
	[326]="RazorClaw", [327]="RazorFang", [541]="AirBalloon",
	[544]="BindingBand", [545]="AbsorbBulb", [639]="WeaknessPolicy",
	[640]="AssaultVest", [648]="LuminousMoss", [649]="Snowball",
	[650]="SafetyGoggles", [686]="RoseliB", [687]="KeeB", [688]="MarangaB",

	[187]="RindoBerry", [241]="BlackBelt", [251]="SilkScarf",
	[308]="InsectPlate", [546]="CellBattery",
}
local moves = {
	"Pound", "KarateChop", "DoubleSlap", "CometPunch", "MegaPunch", "PayDay",
	"FirePunch", "IcePunch", "ThunderPunch", "Scratch", "ViceGrip",
	"Guillotine", "RazorWind", "SwordsDance", "Cut", "Gust", "WingAttack",
	"Whirlwind", "Fly", "Bind", "Slam", "VineWhip", "Stomp", "DoubleKick",
	"MegaKick", "JumpKick", "RollingKick", "SandAttack", "Headbutt",
	"HornAttack", "FuryAttack", "HornDrill", "Tackle", "BodySlam", "Wrap",
	"TakeDown", "Thrash", "DoubleEdge", "TailWhip", "PoisonSting", "Twineedle",
	"PinMissile", "Leer", "Bite", "Growl", "Roar", "Sing", "Supersonic",
	"SonicBoom", "Disable", "Acid", "Ember", "Flamethrower", "Mist", "WaterGun",
	"HydroPump", "Surf", "IceBeam", "Blizzard", "Psybeam", "BubbleBeam",
	"AuroraBeam", "HyperBeam", "Peck", "DrillPeck", "Submission", "LowKick",
	"Counter", "SeismicToss", "Strength", "Absorb", "MegaDrain", "LeechSeed",
	"Growth", "RazorLeaf", "SolarBeam", "PoisonPowder", "StunSpore",
	"SleepPowder", "PetalDance", "StringShot", "DragonRage", "FireSpin",
	"ThunderShock", "Thunderbolt", "ThunderWave", "Thunder", "RockThrow",
	"Earthquake", "Fissure", "Dig", "Toxic", "Confusion", "Psychic", "Hypnosis",
	"Meditate", "Agility", "QuickAttack", "Rage", "Teleport", "NightShade",
	"Mimic", "Screech", "DoubleTeam", "Recover", "Harden", "Minimize",
	"Smokescreen", "ConfuseRay", "Withdraw", "DefenseCurl", "Barrier",
	"LightScreen", "Haze", "Reflect", "FocusEnergy", "Bide", "Metronome",
	"MirrorMove", "SelfDestruct", "EggBomb", "Lick", "Smog", "Sludge",
	"BoneClub", "FireBlast", "Waterfall", "Clamp", "Swift", "SkullBash",
	"SpikeCannon", "Constrict", "Amnesia", "Kinesis", "SoftBoiled",
	"HighJumpKick", "Glare", "DreamEater", "PoisonGas", "Barrage", "LeechLife",
	"LovelyKiss", "SkyAttack", "Transform", "Bubble", "DizzyPunch", "Spore",
	"Flash", "Psywave", "Splash", "AcidArmor", "Crabhammer", "Explosion",
	"FurySwipes", "Bonemerang", "Rest", "RockSlide", "HyperFang", "Sharpen",
	"Conversion", "TriAttack", "SuperFang", "Slash", "Substitute", "Struggle",
	"Sketch", "TripleKick", "Thief", "SpiderWeb", "MindReader", "Nightmare",
	"FlameWheel", "Snore", "Curse", "Flail", "Conversion2", "Aeroblast",
	"CottonSpore", "Reversal", "Spite", "PowderSnow", "Protect", "MachPunch",
	"ScaryFace", "FeintAttack", "SweetKiss", "BellyDrum", "SludgeBomb",
	"MudSlap", "Octazooka", "Spikes", "ZapCannon", "Foresight", "DestinyBond",
	"PerishSong", "IcyWind", "Detect", "BoneRush", "LockOn", "Outrage",
	"Sandstorm", "GigaDrain", "Endure", "Charm", "Rollout", "FalseSwipe",
	"Swagger", "MilkDrink", "Spark", "FuryCutter", "SteelWing", "MeanLook",
	"Attract", "SleepTalk", "HealBell", "Return", "Present", "Frustration",
	"Safeguard", "PainSplit", "SacredFire", "Magnitude", "DynamicPunch",
	"Megahorn", "DragonBreath", "BatonPass", "Encore", "Pursuit", "RapidSpin",
	"SweetScent", "IronTail", "MetalClaw", "VitalThrow", "MorningSun",
	"Synthesis", "Moonlight", "HiddenPower", "CrossChop", "Twister",
	"RainDance", "SunnyDay", "Crunch", "MirrorCoat", "PsychUp", "ExtremeSpeed",
	"AncientPower", "ShadowBall", "FutureSight", "RockSmash", "Whirlpool",
	"BeatUp", "FakeOut", "Uproar", "Stockpile", "SpitUp", "Swallow", "HeatWave",
	"Hail", "Torment", "Flatter", "WillOWisp", "Memento", "Facade",
	"FocusPunch", "SmellingSalts", "FollowMe", "NaturePower", "Charge", "Taunt",
	"HelpingHand", "Trick", "RolePlay", "Wish", "Assist", "Ingrain",
	"Superpower", "MagicCoat", "Recycle", "Revenge", "BrickBreak", "Yawn",
	"KnockOff", "Endeavor", "Eruption", "SkillSwap", "Imprison", "Refresh",
	"Grudge", "Snatch", "SecretPower", "Dive", "ArmThrust", "Camouflage",
	"TailGlow", "LusterPurge", "MistBall", "FeatherDance", "TeeterDance",
	"BlazeKick", "MudSport", "IceBall", "NeedleArm", "SlackOff", "HyperVoice",
	"PoisonFang", "CrushClaw", "BlastBurn", "HydroCannon", "MeteorMash",
	"Astonish", "WeatherBall", "Aromatherapy", "FakeTears", "AirCutter",
	"Overheat", "OdorSleuth", "RockTomb", "SilverWind", "MetalSound",
	"GrassWhistle", "Tickle", "CosmicPower", "WaterSpout", "SignalBeam",
	"ShadowPunch", "Extrasensory", "SkyUppercut", "SandTomb", "SheerCold",
	"MuddyWater", "BulletSeed", "AerialAce", "IcicleSpear", "IronDefense",
	"Block", "Howl", "DragonClaw", "FrenzyPlant", "BulkUp", "Bounce", "MudShot",
	"PoisonTail", "Covet", "VoltTackle", "MagicalLeaf", "WaterSport",
	"CalmMind", "LeafBlade", "DragonDance", "RockBlast", "ShockWave",
	"WaterPulse", "DoomDesire", "PsychoBoost", "Roost", "Gravity", "MiracleEye",
	"WakeUpSlap", "HammerArm", "GyroBall", "HealingWish", "Brine",
	"NaturalGift", "Feint", "Pluck", "Tailwind", "Acupressure", "MetalBurst",
	"UTurn", "CloseCombat", "Payback", "Assurance", "Embargo", "Fling",
	"PsychoShift", "TrumpCard", "HealBlock", "WringOut", "PowerTrick",
	"GastroAcid", "LuckyChant", "MeFirst", "Copycat", "PowerSwap", "GuardSwap",
	"Punishment", "LastResort", "WorrySeed", "SuckerPunch", "ToxicSpikes",
	"HeartSwap", "AquaRing", "MagnetRise", "FlareBlitz", "ForcePalm",
	"AuraSphere", "RockPolish", "PoisonJab", "DarkPulse", "NightSlash",
	"AquaTail", "SeedBomb", "AirSlash", "XScissor", "BugBuzz", "DragonPulse",
	"DragonRush", "PowerGem", "DrainPunch", "VacuumWave", "FocusBlast",
	"EnergyBall", "BraveBird", "EarthPower", "Switcheroo", "GigaImpact",
	"NastyPlot", "BulletPunch", "Avalanche", "IceShard", "ShadowClaw",
	"ThunderFang", "IceFang", "FireFang", "ShadowSneak", "MudBomb", "PsychoCut",
	"ZenHeadbutt", "MirrorShot", "FlashCannon", "RockClimb", "Defog",
	"TrickRoom", "DracoMeteor", "Discharge", "LavaPlume", "LeafStorm",
	"PowerWhip", "RockWrecker", "CrossPoison", "GunkShot", "IronHead",
	"MagnetBomb", "StoneEdge", "Captivate", "StealthRock", "GrassKnot",
	"Chatter", "Judgment", "BugBite", "ChargeBeam", "WoodHammer", "AquaJet",
	"AttackOrder", "DefendOrder", "HealOrder", "HeadSmash", "DoubleHit",
	"RoarOfTime", "SpacialRend", "LunarDance", "CrushGrip", "MagmaStorm",
	"DarkVoid", "SeedFlare", "OminousWind", "ShadowForce", "HoneClaws",
	"WideGuard", "GuardSplit", "PowerSplit", "WonderRoom", "Psyshock",
	"Venoshock", "Autotomize", "RagePowder", "Telekinesis", "MagicRoom",
	"SmackDown", "StormThrow", "FlameBurst", "SludgeWave", "QuiverDance",
	"HeavySlam", "Synchronoise", "ElectroBall", "Soak", "FlameCharge", "Coil",
	"LowSweep", "AcidSpray", "FoulPlay", "SimpleBeam", "Entrainment",
	"AfterYou", "Round", "EchoedVoice", "ChipAway", "ClearSmog", "StoredPower",
	"QuickGuard", "AllySwitch", "Scald", "ShellSmash", "HealPulse", "Hex",
	"SkyDrop", "ShiftGear", "CircleThrow", "Incinerate", "Quash", "Acrobatics",
	"ReflectType", "Retaliate", "FinalGambit", "Bestow", "Inferno",
	"WaterPledge", "FirePledge", "GrassPledge", "VoltSwitch", "StruggleBug",
	"Bulldoze", "FrostBreath", "DragonTail", "WorkUp", "Electroweb",
	"WildCharge", "DrillRun", "DualChop", "HeartStamp", "HornLeech",
	"SacredSword", "RazorShell", "HeatCrash", "LeafTornado", "Steamroller",
	"CottonGuard", "NightDaze", "Psystrike", "TailSlap", "Hurricane",
	"HeadCharge", "GearGrind", "SearingShot", "TechnoBlast", "RelicSong",
	"SecretSword", "Glaciate", "BoltStrike", "BlueFlare", "FieryDance",
	"FreezeShock", "IceBurn", "Snarl", "IcicleCrash", "VCreate", "FusionFlare",
	"FusionBolt", "FlyingPress", "MatBlock", "Belch", "Rototiller", "StickyWeb",
	"FellStinger", "PhantomForce", "TrickOrTreat", "NobleRoar", "IonDeluge",
	"ParabolicCharge", "ForestsCurse", "PetalBlizzard", "FreezeDry",
	"DisarmingVoice", "PartingShot", "TopsyTurvy", "DrainingKiss",
	"CraftyShield", "FlowerShield", "GrassyTerrain", "MistyTerrain",
	"Electrify", "PlayRough", "FairyWind", "Moonblast", "Boomburst",
	"FairyLock", "KingsShield", "PlayNice", "Confide", "DiamondStorm",
	"SteamEruption", "HyperspaceHole", "WaterShuriken", "MysticalFire",
	"SpikyShield", "AromaticMist", "EerieImpulse", "VenomDrench", "Powder",
	"Geomancy", "MagneticFlux", "HappyHour", "ElectricTerrain", "DazzlingGleam",
	"Celebrate", "HoldHands", "BabyDollEyes", "Nuzzle", "HoldBack",
	"Infestation", "PowerUpPunch", "OblivionWing", "ThousandArrows",
	"ThousandWaves", "LandsWrath", "LightOfRuin", "OriginPulse",
	"PrecipiceBlades", "DragonAscent", "HyperspaceFury",
}
local abilities = {
	"Stench", "Drizzle", "SpeedBoost", "BattleArmor", "Sturdy", "Damp",
	"Limber", "SandVeil", "Static", "VoltAbsorb", "WaterAbsorb", "Oblivious",
	"CloudNine", "CompoundEyes", "Insomnia", "ColorChange", "Immunity",
	"FlashFire", "ShieldDust", "OwnTempo", "SuctionCups", "Intimidate",
	"ShadowTag", "RoughSkin", "WonderGuard", "Levitate", "EffectSpore",
	"Synchronize", "ClearBody", "NaturalCure", "LightningRod", "SereneGrace",
	"SwiftSwim", "Chlorophyll", "Illuminate", "Trace", "HugePower",
	"PoisonPoint", "InnerFocus", "MagmaArmor", "WaterVeil", "MagnetPull",
	"Soundproof", "RainDish", "SandStream", "Pressure", "ThickFat", "EarlyBird",
	"FlameBody", "RunAway", "KeenEye", "HyperCutter", "Pickup", "Truant",
	"Hustle", "CuteCharm", "Plus", "Minus", "Forecast", "StickyHold",
	"ShedSkin", "Guts", "MarvelScale", "LiquidOoze", "Overgrow", "Blaze",
	"Torrent", "Swarm", "RockHead", "Drought", "ArenaTrap", "VitalSpirit",
	"WhiteSmoke", "PurePower", "ShellArmor", "AirLock", "TangledFeet",
	"MotorDrive", "Rivalry", "Steadfast", "SnowCloak", "Gluttony", "AngerPoint",
	"Unburden", "Heatproof", "Simple", "DrySkin", "Download", "IronFist",
	"PoisonHeal", "Adaptability", "SkillLink", "Hydration", "SolarPower",
	"QuickFeet", "Normalize", "Sniper", "MagicGuard", "NoGuard", "Stall",
	"Technician", "LeafGuard", "Klutz", "MoldBreaker", "SuperLuck", "Aftermath",
	"Anticipation", "Forewarn", "Unaware", "TintedLens", "Filter", "SlowStart",
	"Scrappy", "StormDrain", "IceBody", "SolidRock", "SnowWarning",
	"HoneyGather", "Frisk", "Reckless", "Multitype", "FlowerGift", "BadDreams",
	"Pickpocket", "SheerForce", "Contrary", "Unnerve", "Defiant", "Defeatist",
	"CursedBody", "Healer", "FriendGuard", "WeakArmor", "HeavyMetal",
	"LightMetal", "Multiscale", "ToxicBoost", "FlareBoost", "Harvest",
	"Telepathy", "Moody", "Overcoat", "PoisonTouch", "Regenerator", "BigPecks",
	"SandRush", "WonderSkin", "Analytic", "Illusion", "Imposter", "Infiltrator",
	"Mummy", "Moxie", "Justified", "Rattled", "MagicBounce", "SapSipper",
	"Prankster", "SandForce", "IronBarbs", "ZenMode", "VictoryStar",
	"Turboblaze", "Teravolt", "AromaVeil", "FlowerVeil", "CheekPouch",
	"Protean", "FurCoat", "Magician", "Bulletproof", "Competitive", "StrongJaw",
	"Refrigerate", "SweetVeil", "StanceChange", "GaleWings", "MegaLauncher",
	"GrassPelt", "Symbiosis", "ToughClaws", "Pixilate", "Gooey", "Aerilate",
	"ParentalBond", "DarkAura", "FairyAura", "AuraBreak", "PrimordialSea",
	"DesolateLand", "DeltaStream",
}

local function strutf8 (data, off, len)
	local buf = {}
	for j=off,off+len,2 do
		local cp = unpack("<I2", data, j)
		if cp == 0 then
			break
		end
		buf[#buf+1] = utf8.char(cp)
	end
	return table.concat(buf)
end

local function decrypt (ekm)
	local pv = unpack("<I4", ekm)
	--print(pv, sv)

	local buf = {}

	-- CryptPKM(ekm, pv, 56)
	local st = pv
	for j=9,232,2 do
		st = 1103515245 * st + 24691 & 0x1p32-1
		buf[#buf+1] = string.pack("<I2", unpack("<I2", ekm, j) ~ (st >> 16))
	end

	st = pv
	for j=233,260,2 do
		st = 1103515245 * st + 24691 & 0x1p32-1
		buf[#buf+1] = string.pack("<I2", unpack("<I2", ekm, j) ~ (st >> 16))
	end

	-- ShuffleArray(ekm, sv, 56)
	local blocks = {
		table.concat(buf, "", 1, 28),
		table.concat(buf, "", 29, 56),
		table.concat(buf, "", 57, 84),
		table.concat(buf, "", 85, 112),
	}
	local positions = {
		0, 1, 2, 3, 0, 1, 3, 2, 0, 2, 1, 3, 0, 3, 1, 2,
		0, 2, 3, 1, 0, 3, 2, 1, 1, 0, 2, 3, 1, 0, 3, 2,
		2, 0, 1, 3, 3, 0, 1, 2, 2, 0, 3, 1, 3, 0, 2, 1,
		1, 2, 0, 3, 1, 3, 0, 2, 2, 1, 0, 3, 3, 1, 0, 2,
		2, 3, 0, 1, 3, 2, 0, 1, 1, 2, 3, 0, 1, 3, 2, 0,
		2, 1, 3, 0, 3, 1, 2, 0, 2, 3, 1, 0, 3, 2, 1, 0,
	}

	local base = (pv >> 13 & 31) * 4 % #positions
	return table.concat{
		ekm:sub(1,8),
		blocks[positions[base+1]+1],
		blocks[positions[base+2]+1],
		blocks[positions[base+3]+1],
		blocks[positions[base+4]+1],
		table.concat(buf, "", 113)
	}
end

local function dothething (data, label)
	if label:sub(1, #os.getenv "HOME") == os.getenv "HOME" then
		label = "~" .. label:sub(#os.getenv "HOME"+1)
	end
	assert(#data == 11872, "Not gen 6 battle video: "..label)
			
	print(("%d-%02d-%02d %02d:%02d:%02d"):format(unpack("<I2BBBBB", data, -16)),
		"Battle #"..unpack("<I2", data, 401).." vs "..jtrainers[data:byte(11485)+1],
		sets[data:byte(11485)+1])

	local parties = {}
	for k=1,4 do
		parties[k] = {}
		for j=1,6 do
			local pkm = decrypt(unpack("c260", data, 3609 + 1568*(k-1) + 260*(j-1)))
			if unpack("<I2", pkm, 9) == 0 then
				break
			end
			parties[k][j] = table.concat({
					names[unpack("<I2", pkm, 9)],
					natures[pkm:byte(29)+1],
					items[unpack("<I2", pkm, 11)] or unpack("<I2", pkm, 11),
					moves[unpack("<I2", pkm, 97)] or "None",
				}, "-") .. "/" .. abilities[pkm:byte(21)]
			print(k, j, parties[k][j])
		end
	end

	local turncount = 0
	local scriptend = unpack("<I4", data, 529) + 533
	local off = 533
	while off < scriptend do
		local thead = data:byte(off)
		if thead == 32 and off == 533 and data:byte(1) == 1 then
			-- start of non-super??
		elseif thead == 160 and off == 533 and data:byte(1) == 2 then
			-- start of super??
		elseif thead >> 4 == 9 then
			turncount = turncount+1
			print("-- START OF TURN "..turncount)
		elseif thead >> 4 == 1 then
			print("[Inter-turn actions]")
		else
			print("??? Turn type "..(thead>>4).."/"..(thead&15))
		end
		off = off+1

		for j=1,thead&15 do
			local phead = data:byte(off)
			local pleft = "P"..((phead>>5)+1)
			local party = parties[(phead>>5)+1]
			local active_slot = 0
			off = off+1

			for k=1,phead&31 do
				active_slot = active_slot+1
				local ahead = data:byte(off)
				local afull = unpack("<I4", data, off)
				if afull == 0 then
					-- "no action"
				elseif afull == 4 then
					print(pleft.." forfeits")
				elseif afull == 8 then
					active_slot = active_slot-1
					print(pleft.." mega evolves")
				elseif ahead & 15 == 1 then
					local target = "@"..(ahead>>4)
					print(pleft.." uses "..moves[unpack("<I3", data, off+1)]..target)
				elseif ahead & 15 == 3 then
					-- XXX only works for singles...
					local slot = (afull >> 8) + 2
					party[active_slot], party[slot] = party[slot], party[active_slot]
					print(pleft.." switches into "..slot.." "..(party[active_slot] or "XXX BUGGED"))
				elseif ahead & 15 == 7 then
					print(pleft.." recharges")
				else
					print("?? "..pleft.." action "..("%08x"):format(unpack(">I4", data, off)))
				end
				off = off+4
			end
		end
	end
end

if #arg == 0 then
	arg[1] = "-"
end

for jj=1,#arg do
	local fh = (function (path)
		if path == "-" then
			return io.stdin
		end
		return assert(io.open(path))
	end)(arg[jj])

	if jj ~= 1 then
		print()
	end
	dothething(fh:read "*a", arg[jj] == "-" and "stdin" or arg[jj])

	if arg[jj] ~= "-" then
		fh:close()
	end
end
