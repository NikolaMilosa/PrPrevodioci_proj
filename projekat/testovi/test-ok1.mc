//OPIS: jedna deklaracija sa dve promenljive
int k(int a, int b, int c) {
    a = 1;
    b = 3;
    a++;
    a--;
    ++a;
    --a;
    b = ++a;
    b = --a;
    a = b++;
    a = b--;
}
int main(int a, int b, int c) {
    unsigned d;
    a = 2;
    b = 3;
    c = 5;
    c = k(a,b,c);
}
