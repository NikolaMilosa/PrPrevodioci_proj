//Testiranje nekih očekivanih grešaka pri semantičkoj analizi
int iFunc(unsigned b){
	return b;           //Greška zbog razlikovanja tipa funkcije i povratne vrednosti
}
unsigned uFunc(int a){
	unsigned d;
	return d;
}
int main(){
	int a,b,c;
	unsigned e,f,g;
	int a;            //Redefinicija a
	unsigned e;       //Redefinicija e
	
	b = 5u;           //Dodela pogrešnog tipa
	
	nepostojecaPromenljiva++;   //Nemoguće izvršiti jer promenljiva nije definisana
	
	if(a < f)         //Poređenje različitih tipova
		f = 4u;

	return 0;
}
