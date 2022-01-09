//
//  LearnPageContentView.swift
//  PierwszaPomocPrzedmedyczna
//
//  Created by Wiktor Kalaga on 26/11/2021.
//

import SwiftUI

struct LearnPageContentView: View {
    
    let headerTitleSubview = "Nauka"
    @State private var protocolsList = [Int: String]()
    @State private var searchedProtocolsList = [Int: String]()
    @State private var searching = false
    
    let protocolsDefinition = [0: "⚠️ Ogólne zasady bezpieczeństwa \n\nPrzed rozpoczęciem udzielania pomocy pamiętaj o:\n- ocenie sytuacji pod kątem zagrożeń takich jak pożar, substancje chemiczne, prąd elektryczny\n- byciu widocznym, np. użyj kamizelki odblaskowej\n- ryzyku zakażenia-zawsze używaj rękawipzekjednorazowych, a jeśli to możliwe to zmieniaj rękawiczki przed podejściem do innych poszkodowanych\n- używaj odpowiedniego sprzętu np. maseczki do sztucznego oddychania\nKorzystaj z pomocy innych - możesz poprosić o wezwanie pomocy, np. udostępnienie apteczki. \n\t\t\tWezwij służby ratownicze.", 1:"🅰️ Apteczka pierwszej pomocy \n\nPoniższa lista pomoże Ci w wyborze gotowej apteczki lub kompletowaniu własnej.\n1. Opaska elastyczna 10cmx4m \n2. Opaska elastyczna 8cmx4m \n3. Bandaż dziany 10cmx4m \n4. Bandaż dziany 4cmx4m \n5. Kompres gazowy 4cmx4m \n6. Kompres gazowy 9 x9cm \n7. Kompres gazowy 1/2m2 \n8. Plaster z gazą 10 x6cm \n9. Plaster z gazą 10 x 8cm \n10. Plaster z gazą 6cm x 1m \n11. Plaster na szpuli 1,25cm x 5m \n12. Plaster na szpuli 5cm x 5m \n13. Chusta trójkątna włókninowy \n14. Opatrunek na oparzenia mały \n15. Siatka opatrunkowa nr 3 \n16. Siatka opatrunkowa nr 4 \n17. Agrafka \n18. Folia izotermiczna \n19. Rękawiczki ratownicze \n20. Nożyczki opatrunkowe \n21. Pęseta anatomiczna \n22. Maseczka do sztucznego oddychania \n23. Płyn do odkażania rąk \n24. Chusteczki do dezynfekcji \n25. Instrukcja Pierwszej Pomocy", 2: "😳 Drgawki \n\nNigdy nie staraj się powstrzymywać drgawek przez trzymanie lub unieruchomienie poszkodowanego - to może spowodować urazy wewnętrzne! \nNie wkładaj nic między zęby poszkodowanego! \nZabezpiecz miejsce zdarzenia - usuń wszystkie przedmioty (np. krzesła), o które mógłby się uderzyć poszkodowany w trakcie ataku drgawek. Zabezpiecz głowę poszkodowanego przed urazami - np. podłóż złożoną kurtkę pod głowę lub chroń głowę trzymając ja w swoich rękach.\n\t\t\tWezwij pomoc medyczną!", 3: "🥶 Odmrożenia \n\nOgólną zasadą jest szybkie ogrzewanie w wodzie o temperaturze 35-40 stopni. Udaj się z poszkodowanym do ciepłego pomieszczenia. Delikatnie usuń mokre/wilgotne ubrania. Usuń biżuterię. \n\nNIE WOLNO PODAWAĆ POSZKODOWANEMU ALKOHOLU DO PICIA W CELU ROZGRZANIA. \n\nNIE WOLNO TAKŻE UŻYWAĆ SUSZAREK DO OGRZEWANIA LUB GRZEJNIKÓW - MOŻNA DOPROWADZIĆ DO OPARZENIA", 4: "🔥 Oparzenia \n\nPrzy oparzeniach TERMICZNYCH oparzoną powierzchnię schładzaj pod bieżącą wodą przez ok. 10 min. Zdejmij biżuterię. Jeśli to możliwe zdejmij ubranie z poszkodowanego, jeśli miejsce oparzenia jest przykryte ubraniem. Okryj ranę jałowym opatrunkiem oparzeniowym. \n\nPrzy oparzeniach chemicznych najlepiej będzie jak zawiadomisz pomoc. Podstawową czynnością jest jednak przepłukanie miejsca strumieniem wody. Jeśli to możliwe należy zdjąć odzienie wierzchnie z poszkodowanego. Okryj ranę jałowym opatrunkiem lub specjalnym opatrunkiem oparzeniowym. \n\nPrzy oparzeniach spowodowanych porażeniem prądem, jeśli nie jesteś pewien poprzestań na wezwaniu pomocy! \nOceń funkcję życiowe-bądź gotów na podjecie RKO. \nOkryj ranę jałowym opatrunkiem - bez opłukiwania wodą!", 5: "⚡️ Porażenia prądem \n\nPorażenie prądem jest groźne dla życia. Porażony poszkodowany może mieć zaburzenia oddychania, silny ból, oparzenia, często nieprzytomny. \n\nOceń sytuacje, ale bądź gotów na podjęcie RKO i udzielenie wsparcia osobie poszkodowanej. \nPamiętaj o bezpieczeństwie własnym - NIE DOTYKAJ poszkodowanego, zanim nie upewnisz się, że poszkodowany został \"odłączony\" od źródła prądu. \n\nWezwij pomoc!! \n\nJeśli widzisz rany oparzeniowe - okryj je jałowym opatrunkiem lub opatrunkiem hydrożelowym.", 6: "🩸 Tamowanie krwotoków \n\nKrwotoki są zagrożeniem życia dla poszkodowanego. Wezwij pomoc medyczną gdy poszkodowany krwawi. \nNie ma znaczenia, czy krwotok jest żylny czy tętniczy. Sposób postępowania zależy od lokalizacji krwotoku. \n\n GŁOWA - obejrzyj ją i zweryfikuj, czy mogło dojść do złamania kości czaszki w okolicy rany, czy to tylko rana skóry. Jeśli kość nie jest uszkodzona, okryj miejsce rany jałowym opatrunkiem i lekko dociśnij, aby zmniejszyć krwawienie. \nJeśli kość jest jednak uszkodzona-tylko okryj ranę opatrunkiem. Wezwij pomoc! \n\nNOS - jeśli poszkodowany jest przytomny - zaleć pozycję siedzącą z głową pochyloną do przodu. \nUżyj chłodnych okładów na skrzydełka nosa i kark poszkodowanego w celu zatrzymania krwawienia. W przypadku braku zatrzymania krwawienia - WEZWIJ POMOC. \n\nOKO lub UCHO - krwawienie z okolic oka lub ucha zazwyczaj świadczy o krwawieniu wewnątrz czaszki. \nZabezpiecz ranę kilkoma warstwami gazy jałowej. Nie dociskaj jej do rany. \nUWAŻAJ! Opatrunek nie może być zbyt szczelny, żeby krew nie gromadziła wewnątrz czaszki. \n\nKLATKA PIERSIOWA - krwawienie w rejonie klatki piersiowej może być związane ze złamaniem żeber lub odmą. Złamanie można poznać po dziwnym ruchu unoszenia się klatki piersiowej - wówczas należy ułożyć poszkodowanego na poszkodowanej stronie. W przypadku odmy, czyli w momencie kiedy ściana klatki piersiowej ulega przedziurawieniu (w dużym skrócie) należy wykonać szczelny opatrunek z jałowej gazy i foliowego okrycia. Odmę można poznać również po bąbelkach powietrza wydostających się z rany. \n\nKoniecznie wezwij POMOC MEDYCZNĄ.\n\nBRZUCH - generalnie załóż na ranę jałowy opatrunek. \nW przypadku, jeśli rana jest obszerna, np. Z rany wydostają się wnętrzności - POD ŻADNYM POZOREM nie próbuj ich umieszczać z powrotem. W takich sytuacjach wykorzystaj również folię w celu okrycia poszkodowanego. Ułóż poszkodowanego w taki sposób, aby odczuwał najmniejszy dyskomfort. \n\nRĘKA lub NOGA - najlepiej ułóż poszkodowanego na plecach. \nUmieść na ranie jałowy opatrunek, dociśnij uszkodzone naczynie do kości. Unieś kończynę powyżej poziomu serca, by zatrzymać krwawienie. \nWykonaj opatrunek uciskowy - kompres gazowy bezpośrednio na ranę, sztywny element uciskający, owiń bandażem. \nWezwij pomoc!", 7: "🥵 Udar słoneczny - przegrzanie \n\nPostaraj się przenieść poszkodowanego do chłodniejszego zacienionego miejsca. Jeśli masz koc ratowniczy, a nie ma nigdzie cienia to możesz osłonić poszkodowanego kocem, ale SREBRNĄ powierzchnią na zewnątrz! Staraj się, aby poszkodowany się nie przeciążał. Obniż temperaturę ciała. Stosuj chłodne kompresy (28-33 stopnie). Unikaj nagłych skoków temperatury! Podaj coś chłodnego do picia, o ile poszkodowany jest przytomny. Jeśli przytomność jest zaburzona, to ułóż pacjenta z nogami uniesionymi do góry (pozycja przeciwwstrząsowa). \n\nWEZWJI POMOC!", 8: "😵‍💫 Ukąszenia i ugryzienia \n\nW przypadku ukąszenia lub pogryzienia pamiętaj o WŁASNYM BEZPIECZEŃSTWIE. \nOsoby uczulone są zagrożone wstrząsem groźnym dla życia - dlatego w celach prewencyjnych zorientuj się u lekarza o odpowiedni preparat i miej go przy sobie. /nPodejrzewaj ukąszenie/ugryzienie, gdy zaobserwujesz: \n-ranę i/lub obrzęk w miejscu ukąszenia/ugryzienia, \n-swędzenie, ból, zaburzenie czucia w miejscu ukąszenia, ugryzienia, \n-zaburzenia widzenia, utratę przytomoności. \n\nOWADY - pszczoły, osy, szerszenie: usuń żądło, jeśli jest w ranie. \nZastosuj zimny okład w miejscu użądlenia. \nW przypadku ukąszeń w okolicach szyim języka, policzka - WZYWAJ POMOC!! \nBowiem obrzęk w tych miejscach może spowodować np. zatkanie dróg oddechowych. Obserwuj poszkodowanego. \n\nGADY - żmije, inne węże: najczęściej spotykanymi ukąszeniami są ukąszenia przez żmije zygzakowate (zygzak na grzebiecie-ciemniejszy od reszty ciała). Pamiętaj o swoim bezpieczeństwie. \nUkąszenie to charakterystyczne dwie rany w postaci punktów. Staraj się nie ruszać poszkodowanego, gdyż zwiększy to już i tak wysokie ciśnienie po ugryzieniu. Usuń wszystkie przedmioty z okolic rany. Nie ingreuj przy ranie-zostaw to specjalistą. Nie tamuj krwawienia, bo przyspieszy to wydostanie się jadu, ale UWAŻAJ. Postaraj się unieruchomić ukąszoną kończynę. \nSkontaktuj się z lekarzem, bowiem niektóre skutki ukąszenia mogą być widoczne kilka godzin po ugryzieniu. /n/nPogryzienie przez PSA: Zorientuj się w okolicznościach zdarzenia-w miarę możliwości ustal właściciela psa, zapytaj czy pies był szczepiony przeciwko wściekliźnie. \nOpatrz ranę-w przypadku podejrzenia wścieklizny, przemyj ranę mydłem. \nUnieruchom zranioną kończynę i unieś ją powyżej poziomu serca. Skontaktuj się z lekarzem, który zastosuje odpowiednie działania profilaktyczne.",9: "🤕 Urazy \n\nNajważniejsze jest utrzymywanie funkcji życiowych i tamowanie krwotoków! \n\nStaraj się nie przemieszczać poszkodowanego, chyba że jest to absolutnie konieczne. \n\nPoruszanie pacjenta z urazem kręgosłupa jest bardzo niebezpieczne i ryzykowne. Jeśli poszkodowany uległ: \n-wypadkowi komunikacyjnemu, \n-upadkowi z wysokości, \n-skoku do wody, \n-porażenia prądem \nmożesz podejrzewać u Niego uraz kręgosłupa. \n\nAby pomóc poszkodowanemu należy podjąć trzy najważniejsze kroki: \n1.Ocena funkcji życiowych organizmu (oddycha/nie oddycha). Jeśli nie oddycha - rozpocznij sztuczne oddychanie i masaż klatki piersiowej. \n2.Jeśli poszkodowany oddycha - zajmij się innymi urazami i zatamuj widoczne krwotoki. \n3. W razie konieczności wezwij pomoc. \n\nRANY i ZRANIENIA \nDo opatrywania ran używaj gazy jałowej - nie stosuj materiałów, które później będą trudne do usunięcia (lignina, wata). \nJeśli w ranie znajdują się ciała obce - nie usuwaj ich, zostaw to specjaliście! \nW przypadku, kiedy w ranę wbity jest jakiś przedmiot - zabezpiecz brzegi rany - dookoła przedmiotu - w miarę możliwości dodatkowo unieruchamiając ciało obce. \n\nZŁAMANIA, SKRĘCENIA i ZWICHNIĘCIA \nW przypadku pierwszej pomocy dot. złamań, skręceń, czy zwichnięć postępowanie ogranicza się do opatrzenia ran lub unieruchomienia kończyny. \nNależy postępować ostrożnie, bowiem każdy niepotrzebny ruch to pogłębienie urazu. \nPamiętaj, że unieruchomienie kończyny jest niezbędne głównie w przypadku braku możliwości wezwania pomocy. \n>Przy urazach kończyn - należy unieruchomić min. dwa sąsiednie od miejsca złamania/skręcenia stawy (powyżej i poniżej). \n>Przy urazach stawów (kolano, łokieć) - unieruchomienie powinno zostać wykonane w pozycji zastanej - NIE WOLNO PROSTOWAĆ KOŃCZYNY. \n>Przy złamaniach żeber - unieruchomić poprzez ułożenie poszkodowanego na boku, po stronie poszkodowanej.", 10: "😬 Wstrząsy \n\nWstrząs masz prawo podejrzewać u osób, które będą miały zaburzenia przytomności - poszkodowany wówczas może być senny, ale jednocześnie pobudzony, lęki, niepokój, zaburzenia orientacji, blada skóra z ”lepkim” potem, przyspieszony oddech. Nieprzytomna osoba również może mieć wstrząs. \n\nPostępowanie we wstrząsie u poszkodowanego jest następujące. \nNależy ułożyć poszkodowanego na plecach. Następnie unieść nogi poszkodowanego ok. 20-30cm powyżej poziomu serca (w przypadku urazów kręgosłupa, głowy, krwotoków górnej części ciała - zaprzestać tej czynności). Owinąć poszkodowanego kocem lub folią ratowniczą - złotym kolorem na zewnątrz.\n Niezwłocznie wezwać pomoc medyczną.", 11: "🚗 Wypadki drogowe \n\nJeśli jesteś świadkiem tego zdarzenia, w pierwszej kolejności najważniejsze jest, aby zachować spokój i bezpieczeństwo - w związku z tym ubierz kamizelkę odblaskową. Zabezpiecz miejsce wypadku -  w tym celu włącz światła awaryjne, ustaw trójkąt ostrzegawczy. Oceń miejsce wypadku, zweryfikuj czy pojazd nie stwarza dodatkowego zagrożenia dla innych uczestników ruchu. \n\nOceń liczbę poszkodowanych osób. Jeśli masz do czynienia z poszkodowanymi, którzy krzyczą i są przytomni oraz tych którzy nie są - zacznij od nich. Jeśli widzisz, że sytuacja wymaga podjęcia próby wyciągania poszkodowanych z samochodu - nie wahaj się i to zrób. \n\nZadzwoń po pomoc medyczną.", 12: "🤭 Zakrztuszenie \n\nZakrztuszenie występuje wówczas, kiedy ciało obce zablokuje drożność dróg oddechowych pacjenta. Jeśli masz do czynienia z zakrztuszeniem - oceń stopień zagrożenia. W przypadku, kiedy poszkodowany może mówić i oddychać to oznacza, że jest to lekka niedrożność i poprzez kaszel można pozbyć się ciała obcego. Natomiast w przypadku, kiedy poszkodowany całkowicie nie może oddychać lub słychać świsty oddechowe - to poważne zagrożenie. \n\nW tym momencie można pomóc poszkodowanemu stojąc za nim, a następnie uderzając z umiarkowaną siłą między łopatki poszkodowanego (poszkodowany powinien być pochylony). Jeśli nie przyniosło to skutku, należy wykonać tzw. manewr Heimlicha. \n\nPolega on na objęciu poszkodowanego ramionami na wysokości nadbrzusza, jedną ręką objąć drugą z zaciśniętą pięścią, a następnie wykonać energiczne pociągnięcie w swoją stronę i ku górze. Spróbuj wykonać tę czynność 5 razy. Jeśli to się nie powiedzie - WEZWIJ POMOC!", 13: "🤢 Zatrucia \n\nŻeby pomóc poszkodowanemu, który się zatruł, w pierwszej kolejności musisz w razie możliwości rozpoznać przyczynę zatrucia oraz generalnie ocenić zatrucie. Istotne podczas rozpoznawania zatrucia są okoliczności zdarzenia i informacje uzyskane od świadków (o ile takowi istnieją). \n\nZatrucia czadem są szczególnie niebezpieczne, dlatego pamiętaj, że Twoje bezpieczeństwo jest najważniejsze. Postaraj się w razie możliwości przewietrzyć miejsce i ewakuować poszkodowanego oraz oczywiście wezwać pomoc. \n\nJednak do najczęstszych zatruć dochodzi w przypadku połknięcia szkodliwych dla organizmu substancji. Jeśli poszkodowany jest przytomny i a substancja, którą zatruł się poszkodowany nie jest żrąca, ani ropopochodna, bądź nie wiesz jaka dokładnie jest ta substancja - możesz spróbować wywołać wymioty. Ale w przeciwnym razie, jeśli nie posiadasz dość informacji na temat zatrucia - nie wywołuj wymiotowania, tylko wezwij pomoc!", 14: "🌊 Tonący człowiek \n\nWarto wiedzieć, że w zależności od rodzaju wody dochodzi do różnych negatywnych procesów w układzie oddechowym i krążenia, które prowadzą lub mogą prowadzić do śmierci. \nNajczęściej w wodzie słodkiej mamy do czynienia z zatrzymaniem krążenia w mechanizmie migotania komór a w płucach nie ma wody. \nNatomiast w wodzie słonej najczęściej dochodzi do obrzęku płuc, którego charakterystycznym objawem jest wydostająca się z ust piana. \n\nNależy pamiętać, że podtopienie lub utonięcie może być związane z innymi przyczynami, jak np. \n-zawał (w wyniku wysiłku), \n-uszkodzenie kręgosłupa (skok do wody i uderzeniem głową o dno), \n-hipotermią (wyziębienie organizmu spowodowane spożyciem alkoholu). \n\nW sytuacji zetknięcia się z przypadkiem tonącego należy przedsięwziąć wszelkie kroki, aby powiadomić odpowiednie służby (numer WOPR: 601 100 100), ale przede wszystkim zadbać o swoje bezpieczeństwo. Jeżeli masz taką możliwość przyciągnij poszkodowanego na brzeg (użyj koła, liny, gałęzi lub innego długiego przedmiotu). \n\nPodczas udzielania pierwszej pomocy poszkodowanemu (po ustaleniu uprzednio własnego bezpieczeństwa) należy sprawdzić jego reakcję poprzez głośne zapytanie: ”Czy wszystko w porządku?”. Jeśli poszkodowany jest przytomny, nie ruszaj go - zaopiekuj się nim i monitoruj jego stan, bowiem może ulec zmianie. Jeśli będzie to konieczne zawiadom służby. \nW przypadku jeśli poszkodowany jest nieprzytomny, ale oddycha postaraj się go ułożyć w pozycji bocznej ustalonej i jednocześnie kontroluj oddech. \n\nJeśli poszkodowany NIE ODDYCHA wówczas należy niezwłocznie zadzwonić po służby medyczne. Być może potrzebny będzie defibrylator. \nReanimacja wygląda następująco: \n> Wykonaj 5 wdmuchnięć powietrza do ust poszkodowanego, \n> Wyznacz punkt ucisku na środku klatki piersiowej poszkodowanego i wykonaj 30 uciśnięć, \n> Wykonaj 2 wdmuchnięcia powietrza. \nCałość należy powtarzać, aż do przyjazdu pomocy."]
    
    var body: some View {
       NavigationView {
           ZStack {
               Color.green.opacity(0.40).ignoresSafeArea()
               VStack(spacing: 0) {
                   Rectangle()
                       .fill(Color.clear)
                       .frame(height: 0)
                       .background(LinearGradient(colors: [.yellow.opacity(0.6), .blue.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing))
                   // SearchBar
                   SearchBar(searching: $searching, mainList: $protocolsList, searchedList: $searchedProtocolsList)
                   // List
                   ScrollView {
                       VStack(spacing: 0) {
                           ForEach(searching ? Array(searchedProtocolsList.keys) : Array(0..<protocolsList.count), id: \.self) { row in
                               NavigationLink(
                                   destination:
                                    DetailsView(selectedProtocol: ( protocolsDefinition[row]) ?? ""),
                                   label: {
                                       ListCell(protocolTitle: protocolsList[row] ?? "").frame(height: 60)
                                   })
                                   .simultaneousGesture(TapGesture().onEnded {
                                       UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                   })
                                   .buttonStyle(ListButtonStyle(highlightColor: Color.green.opacity(0.4)))
                                   .navigationTitle(headerTitleSubview)
                           }
                       }
                   }
               }
               .navigationBarTitleDisplayMode(.inline)
               .navigationTitle(headerTitleSubview)
               .toolbar {
                   ToolbarItemGroup {
                       Image("redcross")
                           .resizable()
                           .frame(width: 40, height: 40)
                   }
               }
           }
       }
       .onAppear(perform: {listOfProtocols()})
    }

    func listOfProtocols() {
        protocolsList[0] = "⚠️ Ogólne zasady bezpieczeństwa"
        protocolsList[1] = "🅰️ Apteczka pierwszej pomocy"
        protocolsList[2] = "😳 Drgawki"
        protocolsList[3] = "🥶 Odmrożenia"
        protocolsList[4] = "🔥 Oparzenia"
        protocolsList[5] = "⚡️ Porażenia prądem"
        protocolsList[6] = "🩸 Tamowanie krwotoków"
        protocolsList[7] = "🥵 Udar słoneczny - przegrzanie"
        protocolsList[8] = "😵‍💫 Ukąszenia i ugryzienia"
        protocolsList[9] = "🤕 Urazy"
        protocolsList[10] = "😬 Wstrząsy"
        protocolsList[11] = "🚗 Wypadki drogowe"
        protocolsList[12] = "🤭 Zakrztuszenie"
        protocolsList[13] = "🤢 Zatrucia"
        protocolsList[14] = "🌊 Tonący człowiek"
    }
}

struct LearnPageContentView_Previews: PreviewProvider {
    static var previews: some View {
        LearnPageContentView()
    }
}

struct ListButtonStyle: ButtonStyle {
    var highlightColor: Color
    func makeBody(configuration: Self.Configuration) -> some View {
           configuration.label.overlay(configuration.isPressed ? highlightColor : Color.clear)
    }
}