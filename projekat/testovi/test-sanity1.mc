//OPIS: Sanity check za miniC gramatiku
void funk(int p,unsigned k, unsigned pr){
    p = 3;
    return;
}
int f(int x, unsigned k) {
    int y;
    return 5;
}

unsigned f2() {
    return 2u;
}

unsigned ff(unsigned x) {
    unsigned y;
    return x + f2() - y;
}

int main() {
    int a = 4,e = 3,f,g,h=2;
    int b;
    int aa;
    int bb;
    int c;
    int d;
    unsigned u = 2u, z = 3u,p,r,k=2u;
    unsigned w;
    unsigned uu;
    unsigned ww;

    //poziv funkcije
    a = f(3, 3u);

    funk(3,3u,5u);

    int ad = 3;
    
    para(a = 3 : 3 : paso 2)
       para(w = 2u : 5u : paso 3u)
    //if iskaz sa else delom
    if (a < b)  //1
        a = 1;
    else
        a = -2;

    if (a + c == b + d - 4) //2
        a = 1;
    else
        a = 2;

    if (u == w) {   //3
        u = ff(1u);
        a = f(11, 3u);
    }
    else {
        w = 2u;
    }
    if (a + c == b - d - -4) {  //4
        a = 1;
    }
    else
        a = 2;
    a = f(32,33u);

    if (a + (aa-c) - d < b + (bb-a))    //5
        uu = w-u+uu;
    else
        d = aa+bb-c;

    //if iskaz bez else dela
    if (a < b)  //6
        a = 1;

    if (a + c == b - +4)    //7
        a = 1;
}

