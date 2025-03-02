# Wstęp do wysokowydajnych komputerów - laboratoria

Prowadzący: [dr hab. inż. prof. uczelni Tadeusz Tomczak](https://wit.pwr.edu.pl/wydzial/struktura-organizacyjna/pracownicy/tadeusz-tomczak)

## Jak działają laby z WdWK z prof. Tomczakiem
Laboratoria 0 (1. zajęcia): Omówienie zasad, tutorial vima, odpalenie gotowego programu “hello world”, tutorial gdb.  

Każde kolejne laboratoria są grupowane po 2, tzn. Lab 1 (zajęcia 2 i 3), Lab 2 (zajęcia 4 i 5), itd.  

Pierwsza część labów to wstępne zadanie. Jeśli nie wyrobicie się z całością do końca zajęć to nic się nie dzieje, ponieważ ta część nie jest oceniania ani wysyłana. Nadróbcie ją przed przyjściem na drugą część.  

Druga część to już pełne zadanie - kody wysyłacie pod koniec zajęć. Od Lab 3 wymagane jest odesłanie sprawozdania (kody i tak wysyłane pod koniec zajęć i z nich ma być sprawozdanie, natomiast w przypadku kiedy się nie wyrobicie można dokończyć zadanie - w sprawozdaniu oznaczacie co zostało wykonane PO zajęciach).  

**UWAGA:** Wszystkie zajęcia odbywały się jednego dnia, więc w założeniu każda grupa miała mieć do wykonania to samo zadanie. Przez godziny dziekańskie 1. zajęcia nie odbyły się w jednej grupie (mojej) przez co ta grupa była przesunięta o tydzień. Skutkowało to tym, że pozostałe grupy miały pierwotną drugą część zadania, a opóźniona grupa zadanie utrudnione/zmienione. Od Lab 3 (od momentu pojawienia się sprawozdań) wszystkie grupy miały te same zadania ze zmienionymi wartościami (np. inna całka).

## Zawartość repo
Lab 1 i Lab 2: kody 1. i 2. części labów dla grupy późniejszej i wcześniejszej (oznaczona jako `-GRUPA1`).  
Lab 3-6: kody tylko 2. części labów dla grupy późniejszej.

## Zadania
Opis zadań jest w każdym sprawozdaniu, poniżej polecenia labów bez sprawozdań.  
### Lab 1
Część 1: Program przepisujący standardowe wejście na standardowe wyjście (nieograniczona ilość danych - konieczna pętla).  

Część 2:  
Grupy wcześniejsze - zrobienie własnego hexdumpa, czyli dla każdego bajta wypisz jego reprezentację szesnastkową w ASCII i newline (wejście 1 bajt, wyjście 3 bajty - wejście to np. plik `hex256` a poprawne wyjście to `hex256.ascii`).  
Grupa późniejsza - to samo ale na odwrót (wejście 3 bajty, wyjście 1 bajt - wejście to np. plik `hex256.ascii` a poprawne wyjście to `hex256`).

### Lab 2
Część 1: Wczytanie dwóch ciągów bajtów (długość podana w kodzie) ze standardowego strumienia i dodanie ich w U2. Pliki `s16.in` i `s16.out`.  

Część 2:  
Grupy wcześniejsze - Fibonacci - wyświetlenie n-tego wyrazu ciągu Fibonacciego (indeks podany na 4 bajtach, wynik wyświetlony na 256 bajtach). Pliki zaczynające się literą `f`.  
Grupa późniejsza - [Dzielenie przez wielokrotne odejmowanie](https://en.wikipedia.org/wiki/Division_algorithm#Division_by_repeated_subtraction). Wczytanie dwóch ciągów po 32 bajty jako dzielna i dzielnik. Wyświetlenie ilorazu i reszty po 32 bajty. Pliki `din32` i `dout32`.

## Oceny
| Nr lab  | Ocena  | Komentarz prowadzącego  |
| :---	| :---   | :---    	|
| Lab 1   | 5.00   | Brak |
| Lab 2   | 5.00   | Przedziwne rozwiązania |
| Lab 3   | 4.75   | Optymalizacje po czasie |
| Lab 4   | 4.00   | Nieznana liczba iteracji pętli! Pojedynczy pomiar! Brak informacji o pracy poza lab. - brak wyników pomiarów. Brak analizy dokładności. // Nie ma pojedynczego pomiaru jak coś XD |
| Lab 5   | 3.50   | Nieznana liczbe iteracji (licznik double). Błędny czas w obliczeniach. vaddsd to też FLOP. jnb to też instrukcja. |
| Lab 6   | 4.00   | Błędne miary wydajności "na sekundę" (p/s, GB/s). Brak optymalizacji. Praktycznie brak profilowania (analizy kodu niskoopziomowego). time.h to nie biblioteka. |

To zostaje mi tylko życzyć powodzenia!
